class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :expected_spending, null: false
      t.integer :actual_spending, null: false

      t.timestamps
    end
  end
end
