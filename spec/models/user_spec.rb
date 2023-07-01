require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "cocina2@gmail.com",
                        password: "12345678",
                        password_confirmation: "12345678",
                        role: 0)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end
end