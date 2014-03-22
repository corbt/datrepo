FactoryGirl.define do
  factory :user do
    username 'testuser'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
    factory :user2 do
      username 'test2'
      email 'test2@example.com'
    end
  end
end
