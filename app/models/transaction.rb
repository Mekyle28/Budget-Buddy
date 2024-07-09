# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  validates :date, presence: true
  validates :merchant, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :amount_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true, inclusion: { in: %w(expense income) }

  monetize :amount_cents, as: :amount

  after_save :update_account_balance
  after_create :update_budget_fact_amount

  private

  def update_account_balance
    if transaction_type == 'income'
      account.update_balance(amount_cents)
    elsif transaction_type == 'expense'
      account.update_balance(-amount_cents)
    end
  end

  def update_budget_fact_amount
    budget = Budget.find_by(category_id: category_id)
    budget.update_fact_amount(amount_cents) if budget
  end
end
