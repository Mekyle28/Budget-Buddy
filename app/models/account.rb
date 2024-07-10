# app/models/account.rb
class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :account_type, presence: true
  validates :current_balance, numericality: { greater_than: 0}
  validates :current_balance_cents, numericality: { greater_than: 0 }

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
