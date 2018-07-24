class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :end_date

      t.timestamps
    end
  end
end
