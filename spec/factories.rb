# frozen_string_literal: true
FactoryGirl.define do
  factory :order do
    name "MyString"
    phone "MyString"
    email "MyString"
    city "MyString"
    warehouse "MyString"
    pay_type 1
  end
  factory :line_item do
    product nil
    cart nil
  end
  factory :cart do
    
  end
  factory :product_image do
    
  end
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
