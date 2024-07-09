class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  after_save :update_account_balance
  after_create :update_budget_fact_amount

  validates :amount_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true, inclusion: { in: %w(expense income) }

  monetize :amount_cents, as: :amount

  private

  def update_account_balance
    
    if transaction_type == 'income'
      account.update!(current_balance_cents: account.current_balance_cents + amount_cents)
    elsif transaction_type == 'expense'
      account.update!(current_balance_cents: account.current_balance_cents - amount_cents)
    end
  end
  
  def update_budget_fact_amount
    budget = Budget.find_by(category_id: self.category_id)
    if budget
      budget.update_fact_amount(self.amount_cents)
    end
  end
end
