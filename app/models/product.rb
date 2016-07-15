class Product < ActiveRecord::Base

  has_many :purchase_options
  has_many :tickets , :order => 'time_left ASC'
  scope :by_newest, order(created_at: :desc)

end
