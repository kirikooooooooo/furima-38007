FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :item do
      name                  {Faker::String.random(length: [1, 40])}
      explanation           {Faker::String.random(length: [1, 1000]) }
      category_id           {Faker::Number.between(from: 2, to: 11)}
      condition_id          {Faker::Number.between(from: 2, to: 7)}
      delivery_charge_id    {Faker::Number.between(from: 2, to: 3)}
      prefecture_id         {Faker::Number.between(from: 2, to: 48)}
      days_to_ship_id       {Faker::Number.between(from: 2, to: 4)}
      price                 {Faker::Number.between(from: 300, to: 9999999)}
      association :user 

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
