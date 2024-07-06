# Clear existing data
Account.destroy_all
Budget.destroy_all
Transaction.destroy_all
Category.destroy_all
User.destroy_all

# Create Users
users = User.create([
  { email: 'user1@example.com', password: 'password' },
  { email: 'user2@example.com', password: 'password' }
])

# Create Accounts
accounts = Account.create([
  { name: 'CHEQUING', account_type: 'DEBIT', current_balance: 100000 },
  { name: 'VISA', account_type: 'CREDIT', current_balance: 50000 },
  { name: 'MC', account_type: 'CREDIT', current_balance: 250000 },
  { name: 'SAVINGS', account_type: 'SAVINGS', current_balance: 150000 }
])

# Create Categories
categories = Category.create([
  { id: 1, name: 'Groceries' },
  { id: 2, name: 'Entertainment' },
  { id: 3, name: 'Utilities' },
  { id: 4, name: 'Rent' },
  { id: 5, name: 'Transportation' },
  { id: 6, name: 'Insurance' },
  { id: 7, name: 'Healthcare' },
  { id: 8, name: 'Savings' },
  { id: 9, name: 'Debt Repayment' },
  { id: 10, name: 'Education' },
  { id: 11, name: 'Personal Care' },
  { id: 12, name: 'Subscriptions' },
  { id: 13, name: 'Gifts' },
  { id: 14, name: 'Donations' },
  { id: 15, name: 'Investments' },
  { id: 16, name: 'Vacation' },
  { id: 17, name: 'Miscellaneous' },
  { id: 18, name: 'Dining Out' },
  { id: 19, name: 'Clothing' },
  { id: 20, name: 'Technology' },
  { id: 21, name: 'Hobbies' }
])

# Create Budgets
budgets = Budget.create([
  { category_id: Category.find_by(name: 'Groceries').id, user_id: users.first.id, budget_amount: 120000, fact_amount: 90000 },
  { category_id: Category.find_by(name: 'Entertainment').id, user_id: users.first.id, budget_amount: 30000, fact_amount: 25000 },
  { category_id: Category.find_by(name: 'Utilities').id, user_id: users.first.id, budget_amount: 100000, fact_amount: 80000 },
  { category_id: Category.find_by(name: 'Rent').id, user_id: users.first.id, budget_amount: 500000, fact_amount: 450000 },
  { category_id: Category.find_by(name: 'Transportation').id, user_id: users.first.id, budget_amount: 60000, fact_amount: 50000 },
  { category_id: Category.find_by(name: 'Insurance').id, user_id: users.first.id, budget_amount: 40000, fact_amount: 30000 },
  { category_id: Category.find_by(name: 'Healthcare').id, user_id: users.first.id, budget_amount: 50000, fact_amount: 40000 },
  { category_id: Category.find_by(name: 'Savings').id, user_id: users.first.id, budget_amount: 100000, fact_amount: 90000 },
  { category_id: Category.find_by(name: 'Debt Repayment').id, user_id: users.first.id, budget_amount: 20000, fact_amount: 15000 },
  { category_id: Category.find_by(name: 'Education').id, user_id: users.first.id, budget_amount: 40000, fact_amount: 30000 },
  { category_id: Category.find_by(name: 'Personal Care').id, user_id: users.first.id, budget_amount: 15000, fact_amount: 12000 },
  { category_id: Category.find_by(name: 'Subscriptions').id, user_id: users.first.id, budget_amount: 10000, fact_amount: 8000 },
  { category_id: Category.find_by(name: 'Gifts').id, user_id: users.first.id, budget_amount: 20000, fact_amount: 15000 },
  { category_id: Category.find_by(name: 'Donations').id, user_id: users.first.id, budget_amount: 10000, fact_amount: 8000 },
  { category_id: Category.find_by(name: 'Investments').id, user_id: users.first.id, budget_amount: 50000, fact_amount: 40000 },
  { category_id: Category.find_by(name: 'Vacation').id, user_id: users.first.id, budget_amount: 60000, fact_amount: 50000 },
  { category_id: Category.find_by(name: 'Miscellaneous').id, user_id: users.first.id, budget_amount: 30000, fact_amount: 20000 },
  { category_id: Category.find_by(name: 'Dining Out').id, user_id: users.first.id, budget_amount: 40000, fact_amount: 30000 },
  { category_id: Category.find_by(name: 'Clothing').id, user_id: users.first.id, budget_amount: 20000, fact_amount: 15000 },
  { category_id: Category.find_by(name: 'Technology').id, user_id: users.first.id, budget_amount: 30000, fact_amount: 25000 },
  { category_id: Category.find_by(name: 'Hobbies').id, user_id: users.first.id, budget_amount: 25000, fact_amount: 20000 }
])

# Create Transactions
transactions = Transaction.create([
  { date: Date.today, merchant: 'Supermarket', amount: 10000, category_id: Category.find_by(name: 'Groceries').id, account: accounts.first },
  { date: Date.today, merchant: 'CINEPLEX', amount: 5000, category_id: Category.find_by(name: 'Entertainment').id, account: accounts.second }
])

50.times do
  Transaction.create(
    date: Date.today - rand(1..100).days,
    merchant: ['Supermarket', 'CINEPLEX', 'Restaurant', 'Online Store'].sample,
    amount: rand(1000..50000),
    category_id: Category.all.sample.id,
    account: accounts.sample
  )
end

puts "Seed data created successfully!"
