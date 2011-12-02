FactoryGirl.define do
  factory :carousel_part, :class => Refinery::Carousel::Part do
    sequence(:title) { |n| "carousel_part_#{n}" }
  end
end
