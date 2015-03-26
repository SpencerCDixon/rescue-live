require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    title "What is the meaning to life?"
    body "lllI can successfully create a questionI can successfully create a questionI can successfully create a questionI can successfully create a questionI can successfully create a questionI can successfully create a questionllll"
    user
  end
end
