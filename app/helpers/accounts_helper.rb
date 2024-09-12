module AccountsHelper


  def lineGraphData(account)
    @month = Date.today.month
    @year = Date.today.year
  
    balance = Account.where(name: account.name).pluck(:current_balance_cents).first
  
    if account.account_type == "CREDIT"
      result = [[Date.today.strftime("%B%d"), balance/-100]]
    else
      result = [[Date.today.strftime("%B%d"), balance/100]]
    end

  
    (Date.today.day).downto(1) do |day|
      transactions = Transaction.where(date: Date.new(@year, @month, day + 1), account_id: account.id).pluck(:transaction_type, :amount_cents)
  
      transactions.each do |transaction|
        if transaction[0] == "expense"
          balance += transaction[1]
        else
          balance -= transaction[1]
        end
      end
      
      if account.account_type == "CREDIT"
        result.unshift(["#{Date.today.strftime("%B%Y")} #{day}", balance/-100])
      else
        result.unshift(["#{Date.today.strftime("%B%Y")} #{day}", balance/100])
      end
    end
  
    # Sort result array by day (ascending) 
    # result.sort_by! { |day, _balance| day }
  
    result
  end


  def dataCredit
    @month = Date.today.month
    @year = Date.today.year
  
    totalBalanceCredit = @balanceCredit.sum

    result = [[Date.today.strftime("%B%d"), totalBalanceCredit/-100]]
      
      # transactions = Transaction.where(date: Date.new(@year, @month, day + 1)).pluck(:transaction_type, :amount_cents)
    (Date.today.day).downto(1) do |day|
      transactions = Transaction.joins(:account)
                          .where(date: Date.new(@year, @month, day + 1))
                          .where(accounts: { account_type: 'CREDIT' })
                          .pluck('transactions.transaction_type', 'transactions.amount_cents', 'accounts.account_type')
  

      transactions.each do |transaction|  
        if transaction[0] == "expense"
          totalBalanceCredit += transaction[1]
        else
          totalBalanceCredit -= transaction[1]
        end
      end

      result.unshift(["#{Date.today.strftime("%B%Y")} #{day}", totalBalanceCredit/-100])
    end
    
    result
  end

  def dataAvailble
    @month = Date.today.month
    @year = Date.today.year
      
    totalBalanceAvailable = @balanceAvailable.sum

    result = [[Date.today.strftime("%B%d"), totalBalanceAvailable/100]]
      
    (Date.today.day).downto(1) do |day|
      transactions = Transaction.joins(:account)
                          .where(date: Date.new(@year, @month, day + 1))
                          .where.not(accounts: { account_type: 'CREDIT' })
                          .pluck('transactions.transaction_type', 'transactions.amount_cents', 'accounts.account_type')

      transactions.each do |transaction|
        if transaction[0] == "expense"
          totalBalanceAvailable += transaction[1]
        else
          totalBalanceAvailable -= transaction[1]
        end
      end

      result.unshift(["#{Date.today.strftime("%B%Y")} #{day}", (totalBalanceAvailable/100)])
    end

    result
  end

  def areaGraphData()
    data = [
      { name: "Account Balance Available", data: dataAvailble },
      { name: "Account Balance Credit", data: dataCredit },
    ]
    return data
  end
  
end
