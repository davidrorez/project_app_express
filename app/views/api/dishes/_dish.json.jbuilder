json.extract! dish, :id, :name, :description, :price, :photo, :state, :created_at, :updated_at
json.url dish_url(dish, format: :json)
