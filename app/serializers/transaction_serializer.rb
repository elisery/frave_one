class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :created_at, :updated_at, :goal_id

  belongs_to :goal
end
