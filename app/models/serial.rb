class Serial < Product

  has_many :chapters, :order => 'chapter ASC'
  scope :by_newest, order(created_at: :desc)

end
