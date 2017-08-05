FactoryGirl.define do

  factory :project1, class: Project do
    id "1"
    name "generic painting"
    price "200"
  end

  factory :comment, class: Comment do
    rating 3
    user
    association :project_id, factory: :project1
    body "Not original at all!"
  end
  
end

