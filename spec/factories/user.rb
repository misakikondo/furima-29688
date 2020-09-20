FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"近藤"}
    first_name            {"みさき"}
    family_name_kana      {"コンドウ"}
    first_name_kana       {"ミサキ"}
    birth                 {1930-10-10}
  end
end