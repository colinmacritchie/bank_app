class BankAccount < ApplicationRecord
  belongs_to :client

  validates :client, presence: true
  validates :account_number, presence: true, uniqueness: true
end
