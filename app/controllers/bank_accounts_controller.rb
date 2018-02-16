class BankAccountsController < ApplicationController

  def index
    @bank_accounts = BankAccount.all
  end

  def show
    @bank_accounts = BankAccount.find(params[:id])
  end

end
