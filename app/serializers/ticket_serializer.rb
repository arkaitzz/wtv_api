class TicketSerializer < ActiveModel::Serializer

  attributes :id
  belongs_to :purchase_option


end
