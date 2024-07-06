# db/migrate/20240706050212_add_amount_cents_to_models.rb
class AddAmountCentsToModels < ActiveRecord::Migration[7.1]
  def change
    rename_column :accounts, :current_balance, :current_balance_cents
    rename_column :budgets, :budget_amount, :budget_amount_cents
    rename_column :budgets, :fact_amount, :fact_amount_cents
    rename_column :transactions, :amount, :amount_cents

    change_column_default :accounts, :current_balance_cents, from: nil, to: 0
    change_column_default :budgets, :budget_amount_cents, from: nil, to: 0
    change_column_default :budgets, :fact_amount_cents, from: nil, to: 0
    change_column_default :transactions, :amount_cents, from: nil, to: 0
  end
end
