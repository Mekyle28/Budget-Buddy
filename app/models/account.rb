# app/models/account.rb
class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy

  def current_balance_bd
    current_balance / 100.0
  end

  def current_balance_bd=(amount)
    self.current_balance = (amount.to_f * 100).to_i
  end
end
