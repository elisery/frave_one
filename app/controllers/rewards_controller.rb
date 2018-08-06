class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reward, only: [:show, :edit, :update, :destroy]
  def index

    # @goal = Goal.find(params[:goal_id])
    @rewards = current_user.rewards.order(title: :asc)
    # render json: params
    # @rewards = Reward.all
  end

  def show
    # render json: params
    @goal = Goal.find(params[:goal_id])
    @rewards = @goal.rewards
  end

  def new
    @reward = Reward.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @reward = Reward.new reward_params
    @reward.user = current_user

    if @reward.save
      redirect_to goal_rewards_path(@goal)
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  private 
  def reward_params
    params.require(:reward).permit(:title, :id)
  end

  def find_reward
    @reward = Reward.find(params[:id])
  end

end
