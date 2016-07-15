class Ticket < ActiveRecord::Base

  belongs_to :user
  belongs_to :purchase_option
  #belongs_to :product , :through => :purchase_option


  validate :validate_purchase

  def time_left
    t = self.expiration_date - Time.now
    # return "%02d:%02d:%02d" % [t/3600%48, t/60%60, t%60]
  end

  private
  def validate_purchase
    a = Ticket.where(:purchase_option_id => self.purchase_option_id, :user_id => self.user_id).where("purchase_date < ? AND expiration_date > ?", Time.now, Time.now)
    unless a.blank?
      errors.add(:error, "Can't purchase if you already own it")
    end
  end
end
