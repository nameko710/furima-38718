FactoryBot.define do
  factory :user do
    nick_name             { Faker::JapaneseMedia::OnePiece.character }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_katakana    { Gimei.first.katakana }
    first_name_katakana   { Gimei.last.katakana }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
