class SerialSerializer < ActiveModel::Serializer

  attributes :id, :title, :plot, :type, :created_at
  has_many :purchase_options
  has_many :chapters

end
