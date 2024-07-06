class Budget < ApplicationRecord
  belongs_to :category
  belongs_to :user

  # Uncomment or create the User model if it doesn't exist
  # class User < ApplicationRecord
  #   has_many :budgets
  # end
end