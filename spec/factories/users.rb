FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {'たなか'}
    last_name {'飯田'}
    last_name_kana {'イイダ'}
    first_name  {'山田'}
    first_name_kana {'ヤマダ'}
    birth_date {'20210202'}
  end
end
