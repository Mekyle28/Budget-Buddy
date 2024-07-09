class AddCurrentMonthToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_column :budgets, :current_month, :boolean, default: false
  end
end
