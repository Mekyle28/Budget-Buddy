module AccountsHelper
  def lineGraphData(account)
    @month = Date.today.month
    @year = Date.today.year
  
    balance = Account.where(name: account.name).pluck(:current_balance_cents).first
  
    if account.account_type == "CREDIT"
      result = [[Date.today.day, balance/-100]]
    else
      result = [[Date.today.day, balance/100]]
    end

  
    (Date.today.day - 1).downto(1) do |day|
      transactions = Transaction.where(date: Date.new(@year, @month, day + 1), account_id: account.id).pluck(:transaction_type, :amount_cents)
  
      transactions.each do |transaction|
        if transaction[0] == "expense"
          balance += transaction[1]
        else
          balance -= transaction[1]
        end
      end
      
      if account.account_type == "CREDIT"
        result.push([day, balance/-100])
      else
        result.push([day, balance/100])
      end
    end
  
    # Sort result array by day (ascending) 
    result.sort_by! { |day, _balance| day }
  
    result
  end


  def AreaGraphData
    @month = Date.today.month
    @year = Date.today.year
  
    balanceCredit = Account.where(account_type: 'CREDIT').pluck(:current_balance_cents)
    balanceAvailable = Account.where.not(account_type: 'CREDIT').pluck(:current_balance_cents)

    totalBalanceCredit = balanceCredit.sum { |balance| balance }
    totalBalanceAvailable = balanceAvailable.sum

    puts "*****************Total Balance in 'CREDIT' accounts: #{totalBalanceCredit} cents"
    puts "************Total Balance in accounts available (not 'CREDIT'): #{totalBalanceAvailable} cents"
  
    # if account.account_type == "CREDIT"
    #   result = [[Date.today.day, balance/-100]]
    # else
    #   result = [[Date.today.day, balance/100]]
    # end

  
    # (Date.today.day - 1).downto(1) do |day|
    #   transactions = Transaction.where(date: Date.new(@year, @month, day + 1), account_id: account.id).pluck(:transaction_type, :amount_cents)
  
    #   transactions.each do |transaction|
    #     if transaction[0] == "expense"
    #       balance += transaction[1]
    #     else
    #       balance -= transaction[1]
    #     end
    #   end
      
    #   if account.account_type == "CREDIT"
    #     result.push([day, balance/-100])
    #   else
    #     result.push([day, balance/100])
    #   end
    # end
  
    # # Sort result array by day (ascending) 
    # result.sort_by! { |day, _balance| day }
  
    # result
  end


end
