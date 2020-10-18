FactoryBot.define do
  factory :game do
    association :home_team, factory: :team
    association :guest_team, factory: :team
    date { Date.today }
  end
end
