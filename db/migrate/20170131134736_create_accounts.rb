class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, default: 'Account'
      t.string :currency, null: false, default: 'PLN'
      t.decimal :multiplier, null: false, default: 1

      t.timestamps
    end
  end
end
