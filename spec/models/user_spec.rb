require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "admin@gmail.com",
                        password: "12345678",
                        password_confirmation: "12345678",
                        role: "admin")
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
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password_confirmation" do
    subject.password_confirmation = nil
    subject.password = "12345678" # Set a password to trigger validation
    expect(subject).to_not be_valid
  end

  it "is not valid without a role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end
end
