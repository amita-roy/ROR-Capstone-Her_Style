FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name { 'Dodo' }
    email { generate :email }
    password { '123456' }
  end

  factory :second_user, class: 'User' do
    name { 'Pete' }
    email { generate :email }
    password { '123456' }
  end
end
