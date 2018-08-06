class CreateRewardItems < ActiveRecord::Migration[5.2]
  def change
    create_table :reward_items do |t|
      t.string :title
      t.integer :milestone
      t.decimal :amount, precision: 5, scale: 2
      t.boolean :redeemed, default: false
      t.references :reward, foreign_key: true

      t.timestamps
    end
  end
end
