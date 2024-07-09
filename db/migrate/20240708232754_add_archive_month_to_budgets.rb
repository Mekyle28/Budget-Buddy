class AddArchiveMonthToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_column :budgets, :archive_month, :date
  end
end
