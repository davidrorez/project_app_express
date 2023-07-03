#Client.create(email: "dd@gmail.com", first_name: "Juan", last_name: "Mora", physical_address: "Test de dirección", password: "12121212", state: 0)
#Client.create(email: "vv@gmail.com", first_name: "María", last_name: "Trejos", physical_address: "Test de dirección 2", password: "12121212", state: 1)

client = Client.create(email: "dd@gmail.com", first_name: "Juan", last_name: "Mora", physical_address: "Test de dirección", password: "12121212", state: 0)
order = Order.create(state: 0, client_id: client.id) 
dish1 = Dish.create(name: "Pizza", description: "Deliciosa pizza de pepperoni", price: 12.99, photo: nil, state: 0) 
dish2 = Dish.create(name: "Hamburguesa", description: "Deliciosa Hamburguesa test", price: 12.99, photo: nil, state: 1) 
order_dish1 = OrderDish.create(order_id: order.id, dish_id: dish1.id, state: 0)
#order_dish2 = OrderDish.create(order_id: 1, dish_id: 2, state: 1)

client2 = Client.create(email: "vv@gmail.com", first_name: "Maria", last_name: "Trejos", physical_address: "Test de dirección 2", password: "12121212", state: 0)
order2 = Order.create(state: 0, client_id: client2.id) 
dish3 = Dish.create(name: "Taco", description: "Delicioso Taco", price: 12.99, photo: nil, state: 0) 
dish4 = Dish.create(name: "Pollo Frito", description: "Deliciosa Pollo frito", price: 12.99, photo: nil, state: 1) 
order_dish3 = OrderDish.create(order_id: order2.id, dish_id: dish3.id, state: 0)
#order_dish4 = OrderDish.create(order_id: 2, dish_id: 4, state: 1)
  