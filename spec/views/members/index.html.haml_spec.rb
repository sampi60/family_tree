require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      create(:member),
      create(:member)
    ])
  end

  before do
    allow(view).to receive_messages(will_paginate: nil)

    controller.singleton_class.class_eval do
      protected
        def sort_column
          'last_name'
        end
        helper_method :sort_column

        def sort_direction
          'asc'
        end
        helper_method :sort_direction
    end
  end

  it 'renders proper set of columns' do
    render
    assert_select "table>thead>tr>th", count: 6
    expect(rendered).to match('Imię i nazwisko')
    expect(rendered).to match('Płeć')
    expect(rendered).to match('Wiek')
    expect(rendered).to match('Adres')
    expect(rendered).to match('Telefon')
  end

  it "renders a list of members" do
    render
    expect(response).to render_template(partial: '_member')
  end
end
