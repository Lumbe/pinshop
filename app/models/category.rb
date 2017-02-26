# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  parent_category_id :integer
#
# Indexes
#
#  index_categories_on_parent_category_id  (parent_category_id)
#
# Foreign Keys
#
#  fk_rails_b7f1bb9825  (parent_category_id => categories.id)
#

class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category",
                          foreign_key: 'parent_category_id',
                          dependent: :destroy
  belongs_to :parent_category, class_name: "Category"
  has_many :products
end
