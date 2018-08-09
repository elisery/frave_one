class Api::V1::RewardsController < Api::ApplicationController
  before_action :authenticate_user!

  def index
    rewards = Reward.order(created_at: :desc)

    render json: rewards
  end

  def show
    render json: reward, include: [ :title, {reward_items: [:title ]} ]
  end

  def create 
    goal = Goal.find(params[:id])
    reward = Reward.new reward_params
    reward.user = current_user
    reward.goal = goal 

    if reward.save
      render json: { id: reward.id }
    else
      render(
        json: { errors: reward.errors}, 
        status: 422
      )
    end
  end

  def destroy
    reward.destroy
    render(json: { status: 200 }, status: 200)
  end

  private
  def reward
    @reward ||= Reward.find params[:id]
  end

  def reward_params
    params.require(:reward).permit(
        :title, 
        :id, 
        { reward_items_attributes: [:title, :milestone, :amount, :id] }
    )
  end

  
end
