class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reward, only: [:show, :destroy]
  def index
    # @goal =   Goal.find(params[:goal_id])
    @rewards = current_user.rewards.order(title: :asc)
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
    @reward = Reward.new
    # @goal = Goal.find(params[:goal_id])
    @goal = @reward.goal
  end

  def create
    @goal = @reward.goal
    # @goal = Goal.find(params[:goal_id])
    @reward = Reward.new reward_params
    @reward.user = current_user

    if @reward.save
      redirect_to goal_rewards_path(@goal)
    else
      render :new
    end

  end

  private 
  def reward_params
    params.require(:reward).permit(:title, :id)
  end

  def find_reward
    @reward = Reward.find(params[:id])
  end

end
