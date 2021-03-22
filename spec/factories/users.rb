FactoryBot.define do
  factory :user, class: 'User' do
    first_name { Forgery(:name).first_name }
    last_name  { Forgery(:name).last_name }
    password { 123456 }
    admin { false }
    email { Forgery(:email).address }

    trait :with_team do
      team { create :team }
    end

    trait :random_team do
      team_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
    end

    trait :random_team_admin do
      team_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
      admin { true }
      password { 654321 }
    end

    trait :admin do
      admin { true }
    end

    after(:build) do |u|
      u.skip_confirmation!
    end
  end
end
