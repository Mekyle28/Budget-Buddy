class MainController < ApplicationController
  def index
    @budget_categories = Budget.includes(:category).where(current_month: true)
  
    @total_fact = @budget_categories.map(&:fact_amount_cents).reduce(0, :+)/100
    
    @total_budget = @budget_categories.map(&:budget_amount_cents).reduce(0, :+)/100

    @account_transactions = Transaction.where(category_id: @category).order(date: :desc)
  
    

  end

end