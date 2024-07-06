# app/models/account.rb
class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :current_balance_cents, numericality: { greater_than_or_equal_to: 0 }

  monetize :current_balance_cents, as: :current_balance
end
