class Serial < Product

  has_many :chapters, :order => 'chapter ASC'

end
