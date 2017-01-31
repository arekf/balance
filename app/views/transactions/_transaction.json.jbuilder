json.extract! transaction, :id, :account, :date, :amount, :description, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)