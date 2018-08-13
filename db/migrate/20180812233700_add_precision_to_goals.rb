class AddPrecisionToGoals < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :amount, :decimal, precision: 10, scale: 2
  end
end
