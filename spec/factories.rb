FactoryBot.define do
  factory(:user) do
    username { Faker::Internet.username }
  end

  factory(:message) do
    content { Faker::Lorem.sentence }
    user
  end
end