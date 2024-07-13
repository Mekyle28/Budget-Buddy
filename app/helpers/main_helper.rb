module MainHelper
  def transactions (category)
    Transaction.where(current_month: true, category_id: category)
  end
  
end
