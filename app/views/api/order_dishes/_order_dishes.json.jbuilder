json.extract! order_dish, :id, :order_id, :dish_id, :state, :created_at, :updated_at
json.url order_url(order_dish, format: :json)
