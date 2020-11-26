class Ephemeri < ApplicationRecord
  has_one_attached :image

  scope :by_name, ->(input) { where('name LIKE ?', input) }

  enum category: %i[musical deportiva noticia]

end
