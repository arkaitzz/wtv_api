class TicketSerializer < ActiveModel::Serializer

  attributes :id, :time_left
  belongs_to :product
  belongs_to :purchase_option


end
