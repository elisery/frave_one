class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.string :indulgence
      t.boolean :reached, default: false
      t.boolean :redeemed, default: false
      t.decimal :milestone, precision: 10, scale: 2
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
