class AddCategoryToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_reference :budgets, :category, null: false, foreign_key: true
  end
end
