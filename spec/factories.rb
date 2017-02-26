# frozen_string_literal: true
FactoryGirl.define do
  factory :product do
    name "MyString"
    price "9.99"
    description "MyText"
  end
  factory :category do
    name "MyString"
  end
  factory :user do
  end
end
