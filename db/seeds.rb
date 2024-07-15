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
  { name: 'Transfer', include_in_budget: false },
  { name: 'Credit Card Payment', include_in_budget: false }
])

# Seed Accounts
accounts = Account.create([
  { name: 'CHEQUING', account_type: 'DEBIT', current_balance_cents: 50000 },
  { name: 'VISA', account_type: 'CREDIT', current_balance_cents: 0 },
  { name: 'MC', account_type: 'CREDIT', current_balance_cents: 0 },
  { name: 'SAVINGS', account_type: 'SAVINGS', current_balance_cents: 100000 }
])

# Seed Budgets for all categories
User.create(email: 'user@example.com', password_digest: 'encrypted_password')

user_id = User.first.id

current_month = Date.today.beginning_of_month

Budget.create([
  { category_id: 1, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 2, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 3, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 4, user_id: user_id, budget_amount_cents: 290000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 5, user_id: user_id, budget_amount_cents: 103500, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 6, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 7, user_id: user_id, budget_amount_cents: 7000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 8, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 9, user_id: user_id, budget_amount_cents: 45000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 10, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 11, user_id: user_id, budget_amount_cents: 9000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 12, user_id: user_id, budget_amount_cents: 6000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 13, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 14, user_id: user_id, budget_amount_cents: 10000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 15, user_id: user_id, budget_amount_cents: 45000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 16, user_id: user_id, budget_amount_cents: 40000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 17, user_id: user_id, budget_amount_cents: 15000, fact_amount_cents: 0, current_month: true, archive_month: current_month },
  { category_id: 18, user_id: user_id, budget_amount_cents: 18000, fact_amount_cents: 0, current_month: true, archive_month: current_month }
])

puts "Seeding current month budgets completed successfully!"

# Seed Transactions

transactions = [
  { date: Date.new(2024, 7, 1), merchant: "WAL-MART", amount_cents: 4950, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 2), merchant: "AMAZON.CA", amount_cents: 3500, category_id: 18, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 3), merchant: "STARBACKS", amount_cents: 550, category_id: 17, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 4), merchant: "UBER* RIDE", amount_cents: 2395, category_id: 5, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 5), merchant: "META PAYCHECK", amount_cents: 450000, category_id: 19, account_id: 1, transaction_type: 'income' },
  { date: Date.new(2024, 7, 6), merchant: "SIRIUS XM", amount_cents: 1150, category_id: 11, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 7), merchant: "WHOLE FOODS", amount_cents: 3200, category_id: 1, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 8), merchant: "PIONEER", amount_cents: 9500, category_id: 5, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 9), merchant: "GOODLIFE FITNESS", amount_cents: 8000, category_id: 10, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 10), merchant: "ENBRIDGEGAS", amount_cents: 9000, category_id: 3, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 11), merchant: "E-TRANSFER", amount_cents: 10000, category_id: 13, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 12), merchant: "AMAZON PRIME", amount_cents: 1200, category_id: 11, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 13), merchant: "CINEPLEX", amount_cents: 2200, category_id: 2, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 14), merchant: "WINNERS", amount_cents: 7900, category_id: 18, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 15), merchant: "HOME DEPOT", amount_cents: 3800, category_id: 16, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 1), merchant: "PAD INVEST", amount_cents: 10000, category_id: 8, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 1), merchant: "PAD INVEST", amount_cents: 10000, category_id: 22, account_id: 4, transaction_type: 'income' },
  { date: Date.new(2024, 7, 2), merchant: "FIDO MOBILE", amount_cents: 6500, category_id: 3, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 3), merchant: "INSTALLMENT PLAN", amount_cents: 45000, category_id: 15, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 4), merchant: "TD INSURANCE", amount_cents: 33300, category_id: 6, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 5), merchant: "SHOPPERS DRUGMART", amount_cents: 3200, category_id: 7, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 6), merchant: "WAL-MART REFUND", amount_cents: 4950, category_id: 1, account_id: 2, transaction_type: 'income' },
  { date: Date.new(2024, 7, 7), merchant: "MANDARIN", amount_cents: 9486, category_id: 2, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 8), merchant: "LONGO'S", amount_cents: 5700, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 9), merchant: "AMZN MKTP", amount_cents: 4500, category_id: 12, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 10), merchant: "UBER* EATS", amount_cents: 5000, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 11), merchant: "LONGO'S", amount_cents: 7650, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 12), merchant: "ERIN MILLS HYUNDAY", amount_cents: 4500, category_id: 5, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 13), merchant: "LEON FADES BARBERSHOP", amount_cents: 6500, category_id: 10, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 14), merchant: "ZARA SQUARE ONE", amount_cents: 15400, category_id: 18, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 15), merchant: "REAL CANADIAN SS", amount_cents: 4200, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 16), merchant: "PIONEER", amount_cents: 8957, category_id: 5, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 17), merchant: "RENT JULY", amount_cents: 290000, category_id: 4, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 18), merchant: "STARSKY FINE FOODS", amount_cents: 7500, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 1), merchant: "IKEA BURLINGTON", amount_cents: 9890, category_id: 16, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 2), merchant: "UBER* RIDE", amount_cents: 2450, category_id: 5, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 3), merchant: "ROGERS INTERNET", amount_cents: 8000, category_id: 3, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 5), merchant: "CINEPLEX", amount_cents: 4950, category_id: 2, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 15), merchant: "META PAYCHECK", amount_cents: 445000, category_id: 19, account_id: 1, transaction_type: 'income' },
  { date: Date.new(2024, 7, 7), merchant: "DISNEY PLUS", amount_cents: 1450, category_id: 11, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 9), merchant: "WHOLE FOODS", amount_cents: 8900, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 11), merchant: "WATER SUPPLY", amount_cents: 2100, category_id: 3, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 12), merchant: "MANDARIN", amount_cents: 9850, category_id: 17, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 14), merchant: "EMTC SUMMER CAMP", amount_cents: 42200, category_id: 9, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 15), merchant: "LONGO'S REFUND", amount_cents: 7650, category_id: 1, account_id: 3, transaction_type: 'income' },
  { date: Date.new(2024, 7, 17), merchant: "NETFLIX", amount_cents: 2400, category_id: 11, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 18), merchant: "BEST BUY", amount_cents: 5500, category_id: 16, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 19), merchant: "WHOLE FOODS", amount_cents: 8900, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 19), merchant: "WAL-MART FOODS", amount_cents: 6490, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 21), merchant: "HOA MONTHLY", amount_cents: 5400, category_id: 3, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 22), merchant: "WAL-MART", amount_cents: 5898, category_id: 1, account_id: 2, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 24), merchant: "PINK!", amount_cents: 1200, category_id: 10, account_id: 3, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 25), merchant: "WAL-MART REFUND", amount_cents: 5475, category_id: 1, account_id: 2, transaction_type: 'income' },
  { date: Date.new(2024, 7, 25), merchant: "PRESTO MOBIL", amount_cents: 2000, category_id: 5, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 25), merchant: "CIBC MUTUAL FUND", amount_cents: 10000, category_id: 14, account_id: 1, transaction_type: 'expense' },
  { date: Date.new(2024, 7, 25), merchant: "CAR LOAN", amount_cents: 75500, category_id: 5, account_id: 1, transaction_type: 'expense' }
]

transactions.each do |transaction|
  Transaction.create!(
    date: transaction[:date],
    merchant: transaction[:merchant],
    amount_cents: transaction[:amount_cents],
    category_id: transaction[:category_id],
    account_id: transaction[:account_id],
    transaction_type: transaction[:transaction_type]
  )

  chosen_account = Account.find(transaction[:account_id])
  if transaction[:transaction_type] == 'expense'
    chosen_account.current_balance_cents -= transaction[:amount_cents]
  else
    chosen_account.current_balance_cents += transaction[:amount_cents]
  end

  chosen_account.save!
end

puts "Seeding manual transactions completed successfully!"



# Seed Archived Budgets
archived_months = (1..12).map { |i| current_month.prev_month(i) }
archived_months.each do |month|
  Budget.create([
    { category_id: 1, user_id: user_id, budget_amount_cents: 100000, fact_amount_cents: 80000, current_month: false, archive_month: month },
    { category_id: 2, user_id: user_id, budget_amount_cents: 20000, fact_amount_cents: 10000, current_month: false, archive_month: month },
    { category_id: 3, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 28000, current_month: false, archive_month: month },
    { category_id: 4, user_id: user_id, budget_amount_cents: 290000, fact_amount_cents: 290000, current_month: false, archive_month: month },
    { category_id: 5, user_id: user_id, budget_amount_cents: 28000, fact_amount_cents: 18000, current_month: false, archive_month: month },
    { category_id: 6, user_id: user_id, budget_amount_cents: 35000, fact_amount_cents: 24500, current_month: false, archive_month: month },
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
