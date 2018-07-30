class TransactionsController < ApplicationController

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
  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :created_at)
  end
end
