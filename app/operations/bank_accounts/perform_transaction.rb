module BankAccounts
  class PerformTransaction

    def initialize(amount:, transaction_type:, bank_account_id:)
      @amount           = amount.try(:to_f)
      @bank_account_id  = bank_account_id
      @transaction_type = transaction_type
      @bank_account     = BankAccount.where(id: @bank_account_id).first
    end

    def execute!
        AccountTransaction.create!(
          bank_account: @bank_account,
          amount: @amount,
          transaction_type: @transaction_type
        )

        if @transaction_type == "withdraw"
          @bank_account.update!(balance: @bank_account.balance - @amount)
        elsif @transaction_type == "deposit"
          @bank_account.update!(balance: @bank_account.balance + @amount)
        end

        @bank_account
    end
  end
end

