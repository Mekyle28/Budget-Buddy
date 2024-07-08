class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  after_save :update_account_balance
  after_create :update_budget_fact_amount

  validates :amount_cents, numericality: { greater_than_or_equal_to: 0 }

  monetize :amount_cents, as: :amount

  private

  def update_account_balance
    account.update(current_balance_cents: account.transactions.sum(:amount_cents))
  end

  def update_budget_fact_amount
    budget = Budget.find_by(category_id: self.category_id)
    if budget
      budget.update_fact_amount(self.amount_cents)
    end
  end
end
