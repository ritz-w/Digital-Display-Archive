FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user, class: User do
    email
    password "M0n0gatar1"
    first_name "Taro"
    last_name "Yamada"
    admin false
  end

  factory :user2, class: User do
    email
    password "M0n0gatar1"
    first_name "Arya"
    last_name "Stark"
    admin false
  end

  factory :user3, class: User do
    email
    password "doggydogg"
    first_name "Snoop"
    last_name "Dogg"
    admin false
  end

  factory :admin, class: User do
    email
    password "G@me0fthrones"
    first_name "Jon"
    last_name "Snow"
    admin true
  end 
end
