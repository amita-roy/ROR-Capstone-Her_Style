FactoryBot.define do
  factory :user, class: 'User' do
    name { 'John' }
    email { 'john@example.com' }
    password { '123456' }
  end

  factory :random_user, class: 'User' do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
