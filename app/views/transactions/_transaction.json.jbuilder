json.extract! transaction, :id, :date, :merchant, :amount, :category, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
