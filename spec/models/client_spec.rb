require 'rails_helper'

RSpec.describe Client, type: :model do
  subject {
    described_class.new(email: "dd@gmail.com",
                        first_name: "Juan",
                        last_name: "Mora",
                        physical_address: "Test de dirección",
                        password: "12121212",
                        state: 0)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a physical_address" do
    subject.physical_address = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a state" do
    subject.state = nil
    expect(subject).to_not be_valid
  end
end
