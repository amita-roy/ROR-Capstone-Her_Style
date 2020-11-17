FactoryBot.define do
  factory :article do
    author_id { 1 }
    title { 'MyString' }
    text { 'MyText' }
    createdat { '2020-11-17' }
  end
end
