module BankAccounts
  class ValidateNewTransaction

    def initialize(amount:, transaction_type:, bank_account_id:)
      @amount           = amount.try(:to_f)
      @bank_account_id  = bank_account_id
      @transaction_type = transaction_type
      @bank_account     = BankAccount.where(id: @bank_account_id).first
      @errors = []
    end

    def execute!
      validate_existence_of_account!
      if @transaction_type == "withdraw" and @bank_account.present?
        validate_withdrawl!
      end
      @errors
    end

    private

    def validate_withdrawl!

      if @bank_account.balance - @amount < 0.00
        @errors << "Not Enough Funds"
      end
    end

    def validate_existence_of_account!
      if @bank_account.blank?
        @errors << "Account Not Found"
      end
    end
  end
end
