FactoryBot.define do
  factory :comment do
    text            { "値下げ希望です" }

    association :user
    association :item

  end
end
