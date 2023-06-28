json.array! @orders do |order|
    json.id order.id 
    json.state order.state
    json.client do
        json.first_name order.client.first_name
        json.last_name order.client.last_name
    end
end
