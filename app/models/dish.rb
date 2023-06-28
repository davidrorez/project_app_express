class Dish < ApplicationRecord

  has_many :order_dishes, dependent: :destroy
  has_many :orders, through: :order_dishes

  has_one_attached :photo
  has_rich_text :description
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :state, presence: true
  enum state: {"available": 0, "unavailable": 1}
  
end
  