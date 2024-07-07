# db/seeds.rb

# Clear existing data
Category.destroy_all
Account.destroy_all
Transaction.destroy_all
Budget.destroy_all
User.destroy_all

# Seed Categories
categories = Category.create([
  { name: 'Groceries' },
  { name: 'Entertainment' },
  { name: 'Utilities' },
  { name: 'Rent' },
  { name: 'Transportation' },
  { name: 'Insurance' },
  { name: 'Healthcare' },
  { name: 'Savings' },
  { name: 'Debt Repayment' },
  { name: 'Education' },
  { name: 'Personal Care' },
  { name: 'Subscriptions' },
  { name: 'Gifts' },
  { name: 'Donations' },
  { name: 'Investments' },
  { name: 'Vacation' },
  { name: 'Miscellaneous' },
  { name: 'Dining Out' },
  { name: 'Clothing' }
])

# Seed Accounts
accounts = Account.create([
  { name: 'CHEQUING', account_type: 'DEBIT', current_balance_cents: 1000000 },
  { name: 'VISA', account_type: 'CREDIT', current_balance_cents: 500000 },
  { name: 'MC', account_type: 'CREDIT', current_balance_cents: 2500000 },
  { name: 'SAVINGS', account_type: 'SAVINGS', current_balance_cents: 1500000 }
])

# Seed Transactions
start_date = Date.new(2024, 6, 1)
end_date = Date.today

# Generate 100 transactions with random amounts and dates
100.times do
  date = rand(start_date..end_date)
  amount_cents = rand(1000..50000)  # Random amount between $10 and $500
  merchant = ["Wal-Mart", "VICTORIA'S SECRET", "TD INSURANCE", "LONGO'S", "STARSKY FINE FOODS", 
              "META PAYROLL", "UBER* EATS", "UBER* RIDE", "INTERNET BILL PAY", "PIONEER STN", 
              "Amazon.CA", "PEEL DISTRICT SCHOOL BOARD", "CINEPLEX ENTERTAINMENT", "PRESTO MOBL", 
              "E-TRANSFER", "Subway 23972", "DEPOSIT CANADA", "IKEA BURLINGTON", "PAYBRIGHT"].sample

  category_id = rand(1..categories.count)
  account_id = rand(1..accounts.count)

  Transaction.create!(
    date: date,
    merchant: merchant,
    amount_cents: amount_cents,
    category_id: category_id,
    account_id: account_id
  )
end

# Seed Budgets for all categories
User.create(email: 'user@example.com', password_digest: 'encrypted_password')

user_id = User.first.id

Budget.create(category_id: 1, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000)
Budget.create(category_id: 2, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000)
Budget.create(category_id: 3, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 28000)
Budget.create(category_id: 4, user_id: user_id, budget_amount_cents: 290000, fact_amount_cents: 290000)
Budget.create(category_id: 5, user_id: user_id, budget_amount_cents: 28000, fact_amount_cents: 18000)
Budget.create(category_id: 6, user_id: user_id, budget_amount_cents: 34800, fact_amount_cents: 24500)
Budget.create(category_id: 7, user_id: user_id, budget_amount_cents: 7000, fact_amount_cents: 3000)
Budget.create(category_id: 8, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000)
Budget.create(category_id: 9, user_id: user_id, budget_amount_cents: 45000, fact_amount_cents: 25000)
Budget.create(category_id: 10, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000)
Budget.create(category_id: 11, user_id: user_id, budget_amount_cents: 9000, fact_amount_cents: 3500)
Budget.create(category_id: 12, user_id: user_id, budget_amount_cents: 6000, fact_amount_cents: 4500)
Budget.create(category_id: 13, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 8000)
Budget.create(category_id: 14, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 9000)
Budget.create(category_id: 15, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 19000)
Budget.create(category_id: 16, user_id: user_id, budget_amount_cents: 40000, fact_amount_cents: 29000)
Budget.create(category_id: 17, user_id: user_id, budget_amount_cents: 15000, fact_amount_cents: 19000)
Budget.create(category_id: 18, user_id: user_id, budget_amount_cents: 18000, fact_amount_cents: 10000)
Budget.create(category_id: 19, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 19000)



puts "Seeding completed successfully!"
