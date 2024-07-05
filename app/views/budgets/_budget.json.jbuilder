json.extract! budget, :id, :category, :budget_amount, :fact_amount, :created_at, :updated_at
json.url budget_url(budget, format: :json)
