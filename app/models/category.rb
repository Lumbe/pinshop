# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  parent_category_id :integer
#  slug               :string
#
# Indexes
#
#  index_categories_on_parent_category_id  (parent_category_id)
#  index_categories_on_slug                (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_b7f1bb9825  (parent_category_id => categories.id)
#

class Category < ApplicationRecord
  include FriendlyId
  friendly_id :name, :use => [:slugged]

  has_many :products

  def min_product_price
    products.map(&:price).min
  end

  def max_product_price
    products.map(&:price).max
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
