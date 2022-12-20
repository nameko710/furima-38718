FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Gimei.address.city.kanji }
    address { Faker::JapaneseMedia::OnePiece.sea }
    building_name { Faker::JapaneseMedia::OnePiece.island }
    phone_number { Faker::Number.number(digits: 10) }
  end
end
