class MainController < ApplicationController
  def index
    @budget_categories = Budget.includes(:category).where(current_month: true)
  end

end