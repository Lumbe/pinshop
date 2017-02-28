class HomeController < ApplicationController
  def index
    @products = Category.find_by_name("футболки, поло").products
  end
end
