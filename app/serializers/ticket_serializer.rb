class TicketSerializer < ActiveModel::Serializer

  attributes :id, :time_left
  belongs_to :purchase_option
  belongs_to :product

end
