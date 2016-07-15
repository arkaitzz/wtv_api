class Product < ActiveRecord::Base

  has_many :purchase_options
  scope :by_newest, order(created_at: :desc)

end
