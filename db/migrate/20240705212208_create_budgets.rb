class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.string :category
      t.integer :budget_amount
      t.integer :fact_amount

      t.timestamps
    end
  end
end
