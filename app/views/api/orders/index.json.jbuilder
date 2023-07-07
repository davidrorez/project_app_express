json.array! @orders do |order|
  puts order.client
  json.id order.id 
  json.state order.state
  json.created_at order.created_at.strftime("%d-%m-%Y %H:%M:%S")
  json.dishes order.dishes.map(&:name).join(", ")
  json.client do
    json.id order.client.id
    json.first_name order.client.first_name
    json.last_name order.client.last_name
  end
end
