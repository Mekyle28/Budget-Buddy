json.extract! account, :id, :name, :account_type, :current_balance, :created_at, :updated_at
json.url account_url(account, format: :json)
