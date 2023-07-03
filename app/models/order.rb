class Order < ApplicationRecord
  
  belongs_to :client
  has_many :order_dishes, dependent: :destroy
  has_many :dishes, through: :order_dishes

  validates :state, presence: true
  validates :client_id, presence: true

  enum state: { "on_Time": 0, "delayed": 1, "late": 2, "cancelled": 3, "delivered": 4 }
end