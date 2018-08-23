require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should belong_to :parent_1 }
  it { should belong_to :parent_2 }

  let(:parent_1) { create :member }
  let(:parent_2) { create :member }
  let(:member) { create :member, parent_1: parent_1, parent_2: parent_2 }

  it 'has a valid factory' do
    expect(member).to be_valid
  end

  it 'returns first_name and last_name in #to_s' do
    expect(create(:member, first_name: 'John', last_name: 'Doe').to_s).to eq 'John Doe'
  end

  it 'searches by given substring' do
    kowalski = create :member, last_name: 'Kowalski'
    expect(Member.search('kowal')).to eq [ kowalski ]
  end

  describe 'family relations' do
    it 'finds #parents' do
      expect(member.parents).to eq [ parent_1, parent_2 ]
    end

    it 'finds #children' do
      child = create :member, parent_1: member
      expect(member.children).to eq [ child ]
    end

    it 'finds #siblings' do
      sibling = create :member, parent_1: parent_1
      expect(member.siblings).to eq [ sibling ]
    end
  end
end
