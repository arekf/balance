class Transaction < ApplicationRecord
  include CurrencyFormatter
  belongs_to :account

  validates :amount, presence: true, numericality: true
  validates :date, presence: true

  after_save :update_account_balance
  after_destroy -> { account.decrement!(:balance, amount) }

  def update_account_balance
    account.decrement!(:balance, amount_was || 0)
    account.increment!(:balance, amount)
  end

  def formatted_amount
    format(amount, account.currency)
  end
end
