class AddSpendingToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_column :budgets, :expected_spending, :integer
    add_column :budgets, :actual_spending, :integer
  end
end
