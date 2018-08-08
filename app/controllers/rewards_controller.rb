class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reward, only: [:show, :destroy]
  def index
    # @goal =   Goal.find(params[:goal_id])
    @rewards = current_user.rewards.order(title: :asc)

    respond_to do | format |
      format.html { render }
      format.json { render json: @rewards }
    end
    # binding.pry
    # render json: params
    # @rewards = Reward.all
  end

  def show
    # render json: params
    # @goal = Goal.find(params[:goal_id])
    @reward = Reward.find params[:id]
    @goal = @reward.goal
    @rewards = @goal.rewards

    # find transactions total to get percentage fulfilled
    @reward_item = RewardItem.new 
    @reward_items = @reward.reward_items.order(milestone: :asc)

  end

  def new
    @goal = Goal.find(params[:id])
    @reward = Reward.new
    # render json: @goal
    4.times { @reward.reward_items.build }
  end

  def create
    @goal = Goal.find(params[:id])
    
    @reward = Reward.new reward_params
    @reward.user = current_user
    @reward.goal = @goal
    # render json: params
    # binding.pry
    if @reward.save
      redirect_to reward_path(@reward)
    else
      # render :new
    end

  end

  private 
  def reward_params
    params.require(:reward).permit(
        :title, 
        :id, 
        { reward_items_attributes: [:title, :milestone, :amount, :id] }
    )
  end

  def reward
    @reward = Reward.find(params[:id])
  end

end
