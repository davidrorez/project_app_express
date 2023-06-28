json.array! @order_dishes do |order_dish|
    json.id order_dish.id
    json.state order_dish.state
    json.order do
        json.id order_dish.order.id
        json.state order_dish.order.state
    end
    json.dish do
        json.id order_dish.dish.id
        json.name order_dish.dish.name
    end
end










