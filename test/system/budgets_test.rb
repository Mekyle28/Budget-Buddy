require "application_system_test_case"

class BudgetsTest < ApplicationSystemTestCase
  setup do
    @budget = budgets(:one)
  end

  test "visiting the index" do
    visit budgets_url
    assert_selector "h1", text: "Budgets"
  end

  test "should create budget" do
    visit budgets_url
    click_on "New budget"

    fill_in "Budget amount", with: @budget.budget_amount
    fill_in "Category", with: @budget.category
    fill_in "Fact amount", with: @budget.fact_amount
    click_on "Create Budget"

    assert_text "Category added"
    click_on "Back"
  end

  test "should update Budget" do
    visit budget_url(@budget)
    click_on "Edit this budget", match: :first

    fill_in "Budget amount", with: @budget.budget_amount
    fill_in "Category", with: @budget.category
    fill_in "Fact amount", with: @budget.fact_amount
    click_on "Update Budget"

    assert_text "Budget was successfully updated"
    click_on "Back"
  end

  test "should destroy Budget" do
    visit budget_url(@budget)
    click_on "Destroy this budget", match: :first

    assert_text "Budget was successfully destroyed"
  end
end
