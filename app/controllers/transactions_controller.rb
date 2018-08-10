class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @goal = Goal.find params[:goal_id]
    @transaction = Transaction.new transaction_params
    @transaction.goal = @goal

    if @transaction.save
      redirect_to goal_path(@goal)
    else
      render "goal/show"
    end
    
  end


  def destroy
    @transaction ||= Transaction.find params[:id]
    @transaction.destroy

    redirect_to goal_path(@transaction.goal)
  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :created_at)
  end
end
