class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.integer :current_balance

      t.timestamps
    end
  end
end
