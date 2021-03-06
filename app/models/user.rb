class User < ActiveRecord::Base

  has_many :tickets, :order => 'expiration_date ASC'

  def alive_tickets
    self.tickets.where("purchase_date < ? AND expiration_date > ?", Time.now, Time.now)
  end

  def dead_tickets
    self.tickets.where("expiration_date < ?", Time.now)
  end

end
