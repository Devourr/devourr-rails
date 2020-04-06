FactoryBot.define do
  # cheat sheet: https://devhints.io/factory_bot

  factory :user do
    name { Faker::Name.name }

    # periods and spaces allowed based off twitter and instagram
    sequence :user_name do |n|
      "#{Faker::Hipster.word.gsub(/ /, '.')}_#{n}"
    end

    sequence :email do |n|
      "person#{n}@example.com"
    end

    password { 'password' }

    # user must confirm their account before signing in
    trait :confirmed do
      before :create do |user|
        user.confirmed_at = Time.now.utc
      end
    end
  end
end
