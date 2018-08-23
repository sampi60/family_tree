require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'bootstrap' do
    it 'build span with glyphicon' do
      expect(helper.glyphicon('user')).to eq '<span class="glyphicon glyphicon-user"></span> '
    end
  end
end
