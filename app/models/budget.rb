class Budget < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true

  validates_numericality_of :budget_amount_cents, greater_than_or_equal_to: 0
  validates_numericality_of :fact_amount_cents, greater_than_or_equal_to: 0

  monetize :budget_amount_cents, as: :budget_amount
  monetize :fact_amount_cents, as: :fact_amount
end
