class RemoveCategoryFromBudgets < ActiveRecord::Migration[7.1]
  def change
    remove_column :budgets, :category
  end
end
