class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.joins(:category, :account).order(date: :desc).limit(50)

    if params[:search].present?
      amount_in_cents = "@"
      if params[:search].to_money.fractional > 0
        amount_in_cents = params[:search].to_money.fractional
      end
      @transactions = @transactions.where(
        "categories.name LIKE :search OR accounts.name LIKE :search OR merchant LIKE :search OR amount_cents LIKE :amount_in_cents",
        search: "%#{params[:search]}%", amount_in_cents: amount_in_cents
      )
    end

    if params[:from_date].present?
      from_date = Date.parse(params[:from_date])
      @transactions = @transactions.where("date >= ?", from_date)
    end

    if params[:to_date].present?
      to_date = Date.parse(params[:to_date])
      @transactions = @transactions.where("date <= ?", to_date)
    end
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @category = Category.where(id: @transaction.category_id)
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', template: 'transactions/new', locals: { transaction: @transaction }) }
      
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transactions_path, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', template: 'transactions/edit', locals: { transaction: @transaction }) }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy!

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:date, :merchant, :amount, :category_id, :account_id, :transaction_type)
  end
end
