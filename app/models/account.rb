# app/models/account.rb
class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :account_type, presence: true
  validates :current_balance, numericality: { greater_than: 0}
  validates :current_balance_cents, numericality: { greater_than: 0 }

  monetize :current_balance_cents, as: :current_balance
end
