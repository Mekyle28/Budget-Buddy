class Transaction < ApplicationRecord
  belongs_to :account

  after_save :update_account_balance

  private

  def update_account_balance
    account.update(current_balance: account.transactions.sum(:amount))
  end
end