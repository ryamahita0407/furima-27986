FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {Gimei.name.first.kanji }
    family_name           {Gimei.name.last.kanji}
    first_name_kana       {Gimei.name.first.katakana}
    family_name_kana      {Gimei.name.last.katakana}
    birthday              {Faker::Date.in_date_period}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
