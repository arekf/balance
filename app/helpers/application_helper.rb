module ApplicationHelper
  def current_controller?(name)
    name.to_s == params[:controller]
  end

  def f(value)
    sprintf("%.2f", value)
  end
end
