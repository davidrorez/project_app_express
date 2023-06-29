require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:client) {Client.create(email: "dd@gmail.com", first_name: "Juan", last_name: "Mora", physical_address: "Test de dirección", password: "12121212", state: 0)}
  let(:order) { Order.create(state: 1, client_id: client.id) }
  subject {
    described_class.new(client_id: client.id,
                        state: 0)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an client_id" do
    subject.client_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an state" do
    subject.state = nil
    expect(subject).to_not be_valid
  end
end