class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :full_name
end
