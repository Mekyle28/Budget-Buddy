class AddTransactionTypeToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :transaction_type, :string, default: 'expense', null: false
  end
end
