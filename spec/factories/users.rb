FactoryBot.define do
  factory :user do
    nickname       { 'テスト太郎' }
    email          { 'geneva@hotmail.com' }
    password       { 'test11' }
    password_confirmation { password }
    last_name      { '田中' }
    first_name     { '太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birth_date { '1989-06-20' }
  end
end
