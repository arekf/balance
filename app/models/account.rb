class Account < ApplicationRecord
  include CurrencyFormatter

  validates :name, presence: true
  validates :currency, presence: true, inclusion: { in: %w(PLN EUR USD) }
  validates :multiplier, presence: true, numericality: true

  has_many :transactions

  def transactions_for(date)
    transactions.where(date: date)
  end

  def transactions_total(date)
    transactions_for(date).sum(:amount)
  end

  def last_transaction_dates(limit = 3)
    transactions.order(date: :desc).select('date').distinct.limit(limit).map(&:date)
  end

  def to_s
    "#{name} #{currency}"
  end

  def formatted_balance
    format(balance, currency)
  end

  def base_currency_balance
    balance * multiplier
  end

  def recalculate_balance!
    update_attribute(:balance, transactions.sum(:amount))
  end
end
