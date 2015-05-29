FactoryGirl.define do

	factory :comment do
		message "whatever"
		rating "1_star"
		association :user
		association :place
	end

  factory :user do
    sequence :email do |n|
      "yoloman#{n}@gmail.com"
    end
    password "omglolhahaha"
  end

  factory :place do
  	name "Suzy's Bagels"
  	description "The best bagels around"
  	address "123 main street, fishkill, ny 12524"
  	latitude(41.538988)
  	longitude(73.899836)
  	association :user
  end
end

