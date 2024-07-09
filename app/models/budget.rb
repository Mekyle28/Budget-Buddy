class Budget < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true

  validates_numericality_of :budget_amount_cents, greater_than_or_equal_to: 0
  validates_numericality_of :fact_amount_cents, greater_than_or_equal_to: 0

  monetize :budget_amount_cents, as: :budget_amount
  monetize :fact_amount_cents, as: :fact_amount

  scope :current_month, -> { where(current_month: true) }

  def update_fact_amount(transaction_amount)
    self.fact_amount_cents += transaction_amount
    save
  end
end