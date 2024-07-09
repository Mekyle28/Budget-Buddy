class AddIncludeInBudgetToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :include_in_budget, :boolean
  end
end
