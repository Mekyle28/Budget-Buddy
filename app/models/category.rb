# app/models/category.rb
class Category < ApplicationRecord
  has_many :budgets
  has_many :transactions
end