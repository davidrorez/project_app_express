class OrderDish < ApplicationRecord

  belongs_to :order
  belongs_to :dish

  validates :state, presence: true
  enum state: { "not_ready_yet": 0, "ready": 1 }
  
end
