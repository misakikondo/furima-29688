FactoryBot.define do
  factory :item do
    items_name          { Faker::Lorem.word }
    explains            { Faker::Lorem.paragraph }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    condition_id        { Faker::Number.between(from: 2, to: 7) }
    item_location_id    { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id     { Faker::Number.between(from: 2, to: 4) }
    shipping_method_id  { Faker::Number.between(from: 2, to: 3) }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
