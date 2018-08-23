require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) { @member = assign(:member, create(:member)) }

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(I18n.locale, @member), "post" do

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[first_name]"

      assert_select "input[name=?]", "member[last_name]"

      assert_select "input[name=?]", "member[sex]"

      assert_select "input[name=?]", "member[address]"

      assert_select "input[name=?]", "member[phone_number]"
    end
  end
end
