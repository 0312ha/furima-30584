FactoryBot.define do

  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password = "1234abcd"
    password              { password }
    password_confirmation { password } 
    familyname_kanji      { "山田" }
    firstname_kanji      { "太朗" }
    familyname_kana       { "ヤマダ" }
    firstname_kana       { "タロウ" }
    birthday              { "1930-01-01" }

  end
end
