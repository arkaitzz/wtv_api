class User < ActiveRecord::Base

  has_many :tickets

  scope :by_n, order(time_left: :desc)

  def alive_tickets
    self.tickets.where("purchase_date < ? AND expiration_date > ?", Time.now, Time.now)
  end

  def dead_tickets
    self.tickets.where("expiration_date < ?", Time.now)
  end

end
