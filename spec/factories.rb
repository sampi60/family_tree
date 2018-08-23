require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'abc.123' }
    first_name { Faker::Superhero.name }
    last_name { Faker::Superhero.suffix }
    sex { %w(M W).sample }
    birthdate { '1950-01-01' }
    address { 'ul. Grunwaldzka 1, Gdańsk' }
    phone_number { '(+48) 500 500 500' }
    type { 'Admin' }
  end

  factory :member do
    email { Faker::Internet.email }
    password { 'abc.123' }
    first_name { Faker::Superhero.name }
    last_name { Faker::Superhero.suffix }
    sex { %w(M W).sample }
    birthdate { '1950-01-01' }
    address { 'ul. Grunwaldzka 1, Gdańsk' }
    phone_number { '(+48) 500 500 500' }
    type { 'Member' }
  end
end
