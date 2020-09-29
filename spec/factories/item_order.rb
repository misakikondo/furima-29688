FactoryBot.define do
  factory :item_order do
    zip_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    block { '青山1-1' }
    building_name { '東京ハイツ' }
    phone { 11111111111 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end