require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, create(:member))
  end

  before do
    controller.singleton_class.class_eval do
      protected
        def sort_column
          'last_name'
        end
        helper_method :sort_column
    end
    controller.singleton_class.class_eval do
      protected
        def sort_direction
          'asc'
        end
        helper_method :sort_direction
    end
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First name/)
    expect(rendered).to match(/Last name/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
  end
end
