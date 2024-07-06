class RemoveExpectedAndActualFromBudgets < ActiveRecord::Migration[7.1]
  def change
    remove_column :budgets, :expected_spending, :integer
    remove_column :budgets, :actual_spending, :integer
  end
end
