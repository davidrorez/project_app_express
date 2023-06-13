require 'rails_helper'

RSpec.describe "tests/edit", type: :view do
  let(:test) {
    Test.create!(
      name: "MyString",
      year: 1
    )
  }

  before(:each) do
    assign(:test, test)
  end

  it "renders the edit test form" do
    render

    assert_select "form[action=?][method=?]", test_path(test), "post" do

      assert_select "input[name=?]", "test[name]"

      assert_select "input[name=?]", "test[year]"
    end
  end
end
