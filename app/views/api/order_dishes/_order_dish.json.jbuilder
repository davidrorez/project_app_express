json.extract! order_dish, :id, :order_id, :dish_id, :created_at, :updated_at
json.url order_dish_url(order_dish, format: :json)
