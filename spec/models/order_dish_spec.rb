require 'rails_helper'

RSpec.describe OrderDish, type: :model do
  let(:client) { Client.create(email: "dd@gmail.com", first_name: "Juan", last_name: "Mora", physical_address: "Test de dirección", password: "12121212", state: 0) }
  let(:order) { Order.create(state: 1, client_id: client.id) }
  let(:dish1) { Dish.create(name: "Pizza", description: "Deliciosa pizza de pepperoni", price: 12.99, photo: nil, state: 0) }
  let(:dish2) { Dish.create(name: "Pizza", description: "Deliciosa pizza de pepperoni", price: 12.99, photo: nil, state: 1) }

  describe "adding dishes to an order" do
    it "associates dishes with the order" do
      order_dish1 = OrderDish.create(order_id: order.id, dish_id: dish1.id)
      order_dish2 = OrderDish.create(order_id: order.id, dish_id: dish2.id)

      expect(order.order_dishes.count).to eq(2)
      expect(order.dishes).to contain_exactly(dish1, dish2)
    end
  end
end

