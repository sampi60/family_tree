require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :type }
  subject { build :user, email: "abcdef@abc.def" } # musi zbudowac bo inne niz :email parametry sa wymagane
  it { should validate_uniqueness_of(:email).case_insensitive }

  it 'has a valid factory' do
    expect(create :user).to be_valid
  end
end
