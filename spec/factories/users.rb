FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_lastname         {Faker::Name.last_name}
    name_firstname        {Faker::Name.first_name }
    name_kana_lastname    {'テストメイ'}
    name_kana_firstname   {'テストミョウジ'}
    birthdate             {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end