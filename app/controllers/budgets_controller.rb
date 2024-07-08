class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]

  # GET /budgets or /budgets.json
  def index
    @budget_categories = Budget.includes(:category).all.map do |budget|
      {
        category: budget.category.name,
        budget_amount: budget.budget_amount.to_f,
        fact_amount: budget.fact_amount.to_f
      }
    end
    @budget = Budget.new
  end

  # GET /budgets/1 or /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets or /budgets.json
  def create
    category = Category.find_or_create_by(name: budget_params[:category_name])

    @budget = Budget.new(
      category: category,
      budget_amount_cents: params[:budget][:budget_amount_cents].to_i * 100,
      fact_amount_cents: 0
    )

    respond_to do |format|
      if @budget.save
        format.html { redirect_to budgets_url, notice: "Category added." }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budget_url(@budget), notice: "Budget was successfully updated." }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: "Budget was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:category_name, :budget_amount_cents)
  end
end
