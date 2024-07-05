class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :merchant
      t.integer :amount
      t.string :category
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
