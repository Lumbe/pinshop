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
#  slug                    :string
#  gender                  :integer          default("male")
#  sizes                   :string           default([]), is an Array
#  trending                :boolean          default(FALSE)
#  brand_id                :integer
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#

class Product < ApplicationRecord
  include Filterable
  include FriendlyId
  friendly_id :slug_candidates, use: :slugged

  scope :price, -> (price) { where price: price }
  scope :sizes, -> (sizes) { where sizes: sizes }
  scope :brand, -> (brand) { where brand_id: brand }
  scope :trending_products, -> {where trending: true}
  scope :novelty_products, -> {where 'novelty_expires_at > ?', Time.current}

  SIZE_CHART = %w(XS S M L XL XXL XXXL)

  enum gender: {
    unisex: 0,
    male: 1,
    female: 2
  }

  belongs_to :category
  belongs_to :brand, optional: true
  has_many :image_variants, dependent: :destroy
  has_many :line_items
  has_attached_file :image, styles: { large: "850x1036>", product: "420x512>", index: "300x366>", thumb: "100x122>" }, default_url: "/images/:style/missing.png"
  has_attached_file :size_chart, styles: { large: "800x800>", medium: "400x400>", small: "250x250>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :name, :price, :category, :image, :sizes, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :size_chart, content_type: /\Aimage\/.*\z/
  validates :old_price, numericality: { greater_than: :price, allow_blank: true }

  before_create :set_novelty_expiration
  before_destroy :ensure_not_referenced_by_any_line_item, prepend: true
  after_commit :regenerate_slug, on: [:create, :update]

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
    slug.blank? || name_changed?
  end

  def set_novelty_expiration
    self.novelty_expires_at = Time.current + 30.days if self.novelty_expires_at.blank?
  end

  def regenerate_slug
    unless slug.include? self.id.to_s
      self.slug = nil
      self.save
    end
  end

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Товар находится в корзине')
      throw :abort
    end
  end

end
