# app/models/category.rb
class Category < ApplicationRecord
  has_many :budgets
  has_many :transactions

  validates :name, presence: true, uniqueness: true
end