Admin.create!(
  email: 'admin@familytree.xyz',
  password: 'admin',
  password_confirmation: 'admin',
  first_name: 'Admin',
  last_name: 'Admin'
)

Client.create!(
  email: 'client@familytree.xyz',
  password: 'client',
  password_confirmation: 'client',
  first_name: 'Client',
  last_name: 'Client'
)

parent_1 = Member.create!(
  email: 'parent1@familytree.xyz',
  password: 'parent1',
  password_confirmation: 'parent1',
  first_name: 'Parent1',
  last_name: 'Parent1',
  address: 'ul. Grunwaldzka 1, Gdańsk',
  phone_number: '(+48) 500 500 500'
)

parent_2 = Member.create!(
  email: 'parent2@familytree.xyz',
  password: 'parent2',
  password_confirmation: 'parent2',
  first_name: 'Parent2',
  last_name: 'Parent2',
  address: 'ul. Grunwaldzka 1, Gdańsk',
  phone_number: '(+48) 500 500 500'
)

Member.create!(
  email: 'member1@familytree.xyz',
  password: 'member1',
  password_confirmation: 'member1',
  first_name: 'Member1',
  last_name: 'Member1',
  address: 'ul. Grunwaldzka 1, Gdańsk',
  phone_number: '(+48) 500 500 500',
  parent_1: parent_1,
  parent_2: parent_2,
)

Member.create!(
  email: 'member2@familytree.xyz',
  password: 'member2',
  password_confirmation: 'member2',
  first_name: 'Member2',
  last_name: 'Member2',
  address: 'ul. Grunwaldzka 1, Gdańsk',
  phone_number: '(+48) 500 500 500',
  parent_1: parent_1,
  parent_2: parent_2,
)
