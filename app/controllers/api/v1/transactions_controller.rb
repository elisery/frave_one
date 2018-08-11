class Api::V1::TransactionsController < Api::ApplicationController
  before_action :authenticate_user!

  # NEED DEF CREATE FOR TRANSACTIONS
  def create 
    goal ||= Goal.find params[:id]
    transaction = Transaction.new transaction_params
    transaction.goal = goal
    # transaction.user = current_user 

    transaction.save!
    render json: { id: transaction.id } 
  end


  def destroy
    transaction ||= Transaction.find params[:id]
    transaction.destroy
    render json: { status: 200 }, status: 200
  end

  def show
    transaction ||= Transaction.find params[:id]
    render json: transaction
  end

  private
  def goal
    goal ||= Goal.find params[:id]
  end

  def transaction_params
    params.require(:transaction).permit(:id, :title, :amount, :goal_id)
  end
  
end
