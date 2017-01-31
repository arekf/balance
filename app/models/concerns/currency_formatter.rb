module CurrencyFormatter
  def format(value, currency = 'PLN')
    sprintf("%.2f #{currency}", value)
  end
end
