class MainController < ApplicationController
  def index
    @budget_categories = Budget.includes(:category).where(current_month: true)
  
    @total_fact = @budget_categories.map do |category|
      category.fact_amount_cents
    end
    puts "total fact************************ #{@total_fact}*****************"
  
  end

end