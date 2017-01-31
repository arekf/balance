class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false
      t.date :date, null: false
      t.decimal :amount, null: false
      t.string :description

      t.timestamps
    end
  end
end
