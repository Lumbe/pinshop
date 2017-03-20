# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  email      :string
#  city       :string
#  warehouse  :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  enum pay_type: {
    'on_delivery' => 0,
    'prepay' => 1
  }
end
