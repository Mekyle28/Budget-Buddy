class MainController < ApplicationController
  def index
    @budgets = Budget.all
  end
end