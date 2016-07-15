class Ticket < ActiveRecord::Base

  belongs_to :user
  belongs_to :purchase_option
  belongs_to :product

  validate :validate_purchase

  def time_left
    self.expiration_date - Time.now
  end

  private
  def validate_purchase
    test = Ticket.where(:purchase_option_id => self.purchase_option_id, :user_id => self.user_id).where("purchase_date < ? AND expiration_date > ?", Time.now, Time.now)
    unless test.blank?
      errors.add(:error, "Can't purchase if you already own it")
    end
  end

end
