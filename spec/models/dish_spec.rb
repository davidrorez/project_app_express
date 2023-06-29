require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject {
    described_class.new(name: "Pizza",
                        description: "Deliciosa pizza de pepperoni",
                        price: 12.99,
                        photo: nil,
                        state: 0)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without state" do
    subject.state = nil
    expect(subject).to_not be_valid
  end
end