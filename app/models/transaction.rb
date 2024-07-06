# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  after_save :update_account_balance

  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  private

  def update_account_balance
    account.update(current_balance: account.transactions.sum(:amount))
  end
end
