FactoryBot.define do
  # Userモデルのテストデータaliceを定義
  factory :alice, class: User do
    'name { "Example User" }'
    'email { "user@example.com" }'
    'password_digest { "PW001" }'
  end
end