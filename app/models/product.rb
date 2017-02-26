# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string           default("")
#  price              :decimal(8, 2)
#  description        :text             default("")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { large: "850x1036>", medium: "300x366>", thumb: "100x122>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
