class ProductSerializer < ActiveModel::Serializer

  cache key: 'product', expires_in: 1.days

  attributes :id, :title, :plot, :type, :created_at
  has_many :purchase_options



end
