class AddBalanceToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :balance, :decimal, default: 0, null: false
  end
end
