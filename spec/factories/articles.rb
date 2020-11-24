FactoryBot.define do
  factory :article do
    author_id { 1 }
    title { 'MyString' }
    text { 'MyText' }
  end
end
