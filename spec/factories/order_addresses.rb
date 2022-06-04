FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :order_address do
    postal_code           {'123-4567'}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    city                  {Faker::Address.city}
    address               {Faker::Address.street_name}
    building_name         {Faker::Address.building_number}
    phone_number          {Faker::Number.between(from: 1000000000, to: 99999999999)}
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
