FactoryBot.define do
  factory :comment, class: 'Comment' do
    content { Forgery('lorem_ipsum').words(10) }
    user_id { Forgery(:basic).number(:at_least => 1, :at_most => 300) }
  end
end