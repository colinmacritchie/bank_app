class BankAccountsController < ApplicationController

  def index
    @bank_accounts = BankAccount.all
  end

  def new
    @bank_accounts = BankAccount.new
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def show
    @bank_accounts = BankAccount.find(params[:id])
  end

  def destroy
  end

end
