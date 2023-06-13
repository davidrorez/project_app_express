require 'rails_helper'

RSpec.describe "tests/show", type: :view do
  before(:each) do
    assign(:test, Test.create!(
      name: "Name",
      year: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
