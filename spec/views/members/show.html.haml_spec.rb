require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :email => "Email",
      :first_name => "First Name",
      :last_name => "Last Name",
      :sex => "Sex",
      :address => "Address",
      :phone_number => "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone Number/)
  end
end
