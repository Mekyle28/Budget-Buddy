class Budget < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates_numericality_of :budget_amount, greater_than_or_equal_to: 0
  validates_numericality_of :fact_amount, greater_than_or_equal_to: 0
end
