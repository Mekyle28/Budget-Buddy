# app/models/account.rb
class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy

  monetize :current_balance_cents, as: :current_balance

  validate :current_balance_validity

  def debit?
    account_type == 'DEBIT'
  end

  def credit?
    account_type == 'CREDIT'
  end

  # Update balance method to handle positive and negative updates
  def update_balance(amount_cents)
    self.current_balance_cents += amount_cents
    save
  end

  private

  def current_balance_validity
    if debit? && current_balance.negative?
      errors.add(:current_balance, "cannot be negative for debit accounts")
    end
  end
end
