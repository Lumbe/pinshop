# == Schema Information
#
# Table name: products
#
#  id                      :integer          not null, primary key
#  name                    :string           default("")
#  price                   :decimal(8, 2)
#  description             :text             default("")
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  category_id             :integer
#  image_file_name         :string
#  image_content_type      :string
#  image_file_size         :integer
#  image_updated_at        :datetime
#  novelty_expires_at      :date
#  old_price               :decimal(8, 2)
#  in_stock                :boolean          default(TRUE)
#  size_chart_file_name    :string
#  size_chart_content_type :string
#  size_chart_file_size    :integer
#  size_chart_updated_at   :datetime
#  sizes                   :text             default("")
#  slug                    :string
#  genders                 :string
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#

class Product < ApplicationRecord
  include FriendlyId
  friendly_id :slug_candidates, use: :slugged

  SIZE_CHART = %w(XS S M L XL XXL XXXL)
  GENDERS = %w(male female unisex)
  serialize :sizes, Array
  serialize :genders, Array

  before_save do
    self.novelty_expires_at = Time.current + 30.days if self.novelty_expires_at.blank?
  end

  after_commit do
    # regenerates friendly_id slug to include :id
    unless slug.include? self.id.to_s
      self.slug = nil
      self.save
    end
  end

  belongs_to :category
  has_many :image_variants, dependent: :destroy

  has_attached_file :image, styles: { large: "850x1036>", product: "420x512>", index: "300x366>", thumb: "100x122>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :size_chart, styles: { large: "800x800>", medium: "400x400>", small: "250x250>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :size_chart, content_type: /\Aimage\/.*\z/

  validates :name, :price, :category, :image, :sizes,
            presence: true
  validates :old_price, numericality: { greater_than: :price, allow_blank: true }

  def create_associated_image(image)
    image_variants.create(image: image)
  end

  def novelty?
    !self.novelty_expires_at.blank? && (self.novelty_expires_at > Time.current) ? true : false
  end


  def related_products
    category.products
  end

  def products_on_sale
    category.products.where.not(old_price: nil)
  end

  def slug_candidates
    [
      [:id, :name]
    ]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
