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
#  novelty_expires_at :date
#  old_price          :decimal(8, 2)
#

class Product < ApplicationRecord
  before_save do
    self.novelty_expires_at = Time.current + 30.days if self.novelty_expires_at.blank?
  end

  belongs_to :category
  has_attached_file :image, styles: { large: "850x1036>", product: "420x512>", index: "300x366>", thumb: "100x122>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :price, :category, :image,
            presence: true
  validates :old_price, numericality: { greater_than: :price, allow_blank: true }

  def novelty?
    !self.novelty_expires_at.blank? && (self.novelty_expires_at > Time.current) ? true : false
  end
end
