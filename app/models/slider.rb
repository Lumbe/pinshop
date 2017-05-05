# == Schema Information
#
# Table name: sliders
#
#  id                 :integer          not null, primary key
#  visible            :boolean          default(TRUE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slide_file_name    :string
#  slide_content_type :string
#  slide_file_size    :integer
#  slide_updated_at   :datetime
#  category_id        :integer
#  brand_id           :integer          default([]), is an Array
#

class Slider < ApplicationRecord

  belongs_to :category

  has_attached_file :slide, styles: { medium: "870x360>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :slide, content_type: /\Aimage\/.*\z/

  validates :slide, presence: true

end
