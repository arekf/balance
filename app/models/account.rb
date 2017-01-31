class Account < ApplicationRecord
  include CurrencyFormatter

  validates :name, presence: true
  validates :currency, presence: true, inclusion: { in: %w(PLN EUR USD) }
  validates :multiplier, presence: true, numericality: true

  def formatted_balance
    format(balance, currency)
  end
end
