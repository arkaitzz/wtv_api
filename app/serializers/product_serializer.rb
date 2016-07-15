class ProductSerializer < ActiveModel::Serializer

  attributes :id, :title, :plot, :type, :created_at
  has_many :purchase_options

end
