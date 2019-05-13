class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner
  belongs_to :owner, class_name: 'User'
end
