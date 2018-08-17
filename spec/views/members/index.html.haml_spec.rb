require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :email => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :sex => "Sex",
        :address => "Address",
        :phone_number => "Phone Number"
      ),
      Member.create!(
        :email => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :sex => "Sex",
        :address => "Address",
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end
