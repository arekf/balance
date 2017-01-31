class DashboardController < ApplicationController
  def index
    @accounts = Account.order(created_at: :asc)
  end
end
