class Api::V1::GoalsController < Api::ApplicationController
  before_action :authenticate_user!
  def index
    goals = Goal.order(created_at: :desc)

    render json: goals
  end

  def show
    render json: goal
  end

  def create 
    goal = Goal.new goal_params
    goal.user = current_user

    goal.save!
    render json: { id: goal.id }
  end

  def destroy
    goal.destroy
    render(json: { status: 200}, status: 200)
  end

  private
  def goal
    @goal ||= Goal.find params[:id]
  end

  def goal_params
    params.require(:goal).permit(:title, :amount, :end_date, :id)
  end

end
