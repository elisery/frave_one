class AddGoalToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :goal, foreign_key: true
  end
end
