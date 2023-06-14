class Dish < ApplicationRecord
    has_one_attached :photo
    has_rich_text :description
  
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :photo, attached: true, content_type: ['image/png', 'image/jpeg', 'image/jpg']
  
  end
  