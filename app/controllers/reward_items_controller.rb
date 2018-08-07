class RewardItemsController < ApplicationController
  before_action :authenticate_user!
  # before_action :authorize_user!

  def new
    @reward_item = RewardItem.new
  end

  def create
    # @goal = Goal.find(params[:goal_id])
    @reward = Reward.find params[:reward_id]
    @goal = @reward.goal
    @reward_item = RewardItem.new reward_item_params

    @reward_item.reward = @reward
    @reward_item.reward.user = current_user 
    # binding.pry
    if @reward_item.save 
      redirect_to reward_path(@reward)
    else
      @reward_items = @reward.reward_items.order(milestone: :asc)
      render "rewards/show"
    end

  end

  private
  def reward_item_params
    params.require(:reward_item).permit(:title, :amount, :milestone, :redeemed, :id)
  end

  def authorize_user!
    @reward_item = RewardItem.find params[:id]

    unless can?(:manage, @reward_item)
      flash[:danger] = "Access Denied"
      redirect_to dashboard_path
    end
  end

end
