# db/seeds.rb

# Clear existing data
Category.destroy_all
Account.destroy_all
Transaction.destroy_all
Budget.destroy_all
User.destroy_all

# Seed Categories
categories = Category.create([
  { name: 'Groceries', include_in_budget: true },
  { name: 'Entertainment', include_in_budget: true },
  { name: 'Utilities', include_in_budget: true },
  { name: 'Rent', include_in_budget: true },
  { name: 'Transportation', include_in_budget: true },
  { name: 'Insurance', include_in_budget: true },
  { name: 'Healthcare', include_in_budget: true },
  { name: 'Savings', include_in_budget: true },
  { name: 'Education', include_in_budget: true },
  { name: 'Personal Care', include_in_budget: true },
  { name: 'Subscriptions', include_in_budget: true },
  { name: 'Gifts', include_in_budget: true },
  { name: 'Donations', include_in_budget: true },
  { name: 'Investments', include_in_budget: true },
  { name: 'Vacation', include_in_budget: true },
  { name: 'Miscellaneous', include_in_budget: true },
  { name: 'Dining Out', include_in_budget: true },
  { name: 'Clothing', include_in_budget: true },
  { name: 'Paycheck', include_in_budget: false },
  { name: 'Benefit', include_in_budget: false },
  { name: 'Refund', include_in_budget: false },
  { name: 'Credit Card Payment', include_in_budget: false }
])

# Seed Accounts
accounts = Account.create([
  { name: 'CHEQUING', account_type: 'DEBIT', current_balance_cents: 150000 },
  { name: 'VISA', account_type: 'CREDIT', current_balance_cents: 0 },
  { name: 'MC', account_type: 'CREDIT', current_balance_cents: 0 },
  { name: 'SAVINGS', account_type: 'SAVINGS', current_balance_cents: 300000 }
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
  chosen_account = accounts.sample
  transaction_type = ['expense', 'income'].sample

  Transaction.create!(
    date: date,
    merchant: merchant,
    amount_cents: amount_cents,
    category_id: category_id,
    account_id: chosen_account.id,
    transaction_type: transaction_type
  )

  if transaction_type == 'expense'
    chosen_account.current_balance_cents -= amount_cents
  else
    chosen_account.current_balance_cents += amount_cents
  end

  chosen_account.save!
end

# Seed Budgets for all categories
User.create(email: 'user@example.com', password_digest: 'encrypted_password')

user_id = User.first.id

current_month = Date.today.beginning_of_month

Budget.create([
  { category_id: 1, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000, current_month: true, archive_month: current_month },
  { category_id: 2, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000, current_month: true, archive_month: current_month },
  { category_id: 3, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 28000, current_month: true, archive_month: current_month },
  { category_id: 4, user_id: user_id, budget_amount_cents: 290000, fact_amount_cents: 290000, current_month: true, archive_month: current_month },
  { category_id: 5, user_id: user_id, budget_amount_cents: 28000, fact_amount_cents: 18000, current_month: true, archive_month: current_month },
  { category_id: 6, user_id: user_id, budget_amount_cents: 34800, fact_amount_cents: 24500, current_month: true, archive_month: current_month },
  { category_id: 7, user_id: user_id, budget_amount_cents: 7000, fact_amount_cents: 3000, current_month: true, archive_month: current_month },
  { category_id: 8, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000, current_month: true, archive_month: current_month },
  { category_id: 9, user_id: user_id, budget_amount_cents: 45000, fact_amount_cents: 25000, current_month: true, archive_month: current_month },
  { category_id: 10, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000, current_month: true, archive_month: current_month },
  { category_id: 11, user_id: user_id, budget_amount_cents: 9000, fact_amount_cents: 3500, current_month: true, archive_month: current_month },
  { category_id: 12, user_id: user_id, budget_amount_cents: 6000, fact_amount_cents: 4500, current_month: true, archive_month: current_month },
  { category_id: 13, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 8000, current_month: true, archive_month: current_month },
  { category_id: 14, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 9000, current_month: true, archive_month: current_month },
  { category_id: 15, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 19000, current_month: true, archive_month: current_month },
  { category_id: 16, user_id: user_id, budget_amount_cents: 40000, fact_amount_cents: 29000, current_month: true, archive_month: current_month },
  { category_id: 17, user_id: user_id, budget_amount_cents: 15000, fact_amount_cents: 19000, current_month: true, archive_month: current_month },
  { category_id: 18, user_id: user_id, budget_amount_cents: 18000, fact_amount_cents: 10000, current_month: true, archive_month: current_month },
  { category_id: 19, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 19000, current_month: true, archive_month: current_month }
])

puts "Seeding current month budgets completed successfully!"

# Seed Archived Budgets
archived_months = (1..12).map { |i| current_month.prev_month(i) }
archived_months.each do |month|
  Budget.create([
    { category_id: 1, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000, current_month: false, archive_month: month },
    { category_id: 2, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000, current_month: false, archive_month: month },
    { category_id: 3, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 28000, current_month: false, archive_month: month },
    { category_id: 4, user_id: user_id, budget_amount_cents: 290000, fact_amount_cents: 290000, current_month: false, archive_month: month },
    { category_id: 5, user_id: user_id, budget_amount_cents: 28000, fact_amount_cents: 18000, current_month: false, archive_month: month },
    { category_id: 6, user_id: user_id, budget_amount_cents: 34800, fact_amount_cents: 24500, current_month: false, archive_month: month },
    { category_id: 7, user_id: user_id, budget_amount_cents: 7000, fact_amount_cents: 3000, current_month: false, archive_month: month },
    { category_id: 8, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000, current_month: false, archive_month: month },
    { category_id: 9, user_id: user_id, budget_amount_cents: 45000, fact_amount_cents: 25000, current_month: false, archive_month: month },
    { category_id: 10, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000, current_month: false, archive_month: month },
    { category_id: 11, user_id: user_id, budget_amount_cents: 9000, fact_amount_cents: 3500, current_month: false, archive_month: month },
    { category_id: 12, user_id: user_id, budget_amount_cents: 6000, fact_amount_cents: 4500, current_month: false, archive_month: month },
    { category_id: 13, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 8000, current_month: false, archive_month: month },
    { category_id: 14, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 9000, current_month: false, archive_month: month },
    { category_id: 15, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 19000, current_month: false, archive_month: month },
    { category_id: 16, user_id: user_id, budget_amount_cents: 40000, fact_amount_cents: 29000, current_month: false, archive_month: month },
    { category_id: 17, user_id: user_id, budget_amount_cents: 15000, fact_amount_cents: 19000, current_month: false, archive_month: month },
    { category_id: 18, user_id: user_id, budget_amount_cents: 18000, fact_amount_cents: 10000, current_month: false, archive_month: month },
    { category_id: 19, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 19000, current_month: false, archive_month: month }
  ])
end

puts "Seeding completed successfully!"
