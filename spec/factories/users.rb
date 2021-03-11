FactoryBot.define do
  factory :user, class: 'User' do
    first_name { Forgery(:name).first_name }
    last_name  { Forgery(:name).last_name }
    password { Forgery(:basic).password }
    admin { false }
    email { Forgery(:email).address }

    trait :with_team do
      team { create :team }
    end
    after(:build) do |u|
      u.skip_confirmation!
    end
  end
end
