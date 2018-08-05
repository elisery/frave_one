class GoalsController < ApplicationController
  before_action :find_goal, only: [:show, :edit, :update, :destroy, :get_transactions]
  # after_create :set_milestones

  def new
  end

  def create
  end

  def index
    # render json: @goals
    @goals = current_user.goals.order(created_at: :desc)
  end

  def show
    @goal.save

    @transaction = Transaction.new
    @transactions = @goal.transactions.order(created_at: :desc)
    @transactions_count = @transactions.all.sum(:amount)
  end

  private
  def find_goal
    @goal = Goal.find params[:id]
  end

  def set_milestones
    @goal = Goal.find params[:id]
    milestones = [0.15, 0.30, 0.50, 0.75]
    milestones.each do |ms| 
      @reward = Reward.create(milestone: ms)
      @reward.goal = @goal
    end
  end

end

# def self.goal_totals
#   Goal.group("goals.id")
#     .order("t_amount desc")
#     .includes(:transactions)
#     .pluck("goals.title, sum(transactions.amount) as t_amount")
# end