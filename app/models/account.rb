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

  def checking?
    name.downcase == 'checking'
  end

  def per_day
    days_left = Time.days_in_month(Time.now.month, Time.now.year) - Time.now.day + 1
    balance / days_left
  end

  def formatted_per_day
    format(per_day, currency)
  end
end
