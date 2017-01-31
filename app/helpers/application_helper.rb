module ApplicationHelper
  def current_controller?(name)
    name.to_s == params[:controller]
  end

  def total_balance
    "#{number_to_currency(Account.all.map(&:base_currency_balance).sum, unit: '')} PLN"
  end

  def amount_class(amount)
    amount < 0 ? 'text-danger' : 'text-success'
  end

  def format(value, currency = 'PLN')
    sprintf("%.2f #{currency}", value)
  end
end
