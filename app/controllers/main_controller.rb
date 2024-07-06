class MainController < ApplicationController
  def index
    @budget_categories = Budget.includes(:category).all
  end

end