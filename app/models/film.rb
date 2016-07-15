class Film < Product

  scope :by_newest, order(created_at: :desc)

end

