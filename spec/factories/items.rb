FactoryBot.define do
  factory :item do
    Faker::Config.locale = 'ja'
      name                  {Faker::String.random(length: [1, 40])}
      explanation           {Faker::String.random(length: [1, 1000]) }
      category_id           {Number.between(from: 2, to: 11)}
      condition_id          {Number.between(from: 2, to: 7)}
      delivery_charge_id    {Number.between(from: 2, to: 3)}
      prefecture_id         {Number.between(from: 2, to: 48)}
      days_to_ship_id       {Number.between(from: 2, to: 4)}
      price                 {Number.between(from: 300, to: 9999999)}
      association :user 
  end
end
