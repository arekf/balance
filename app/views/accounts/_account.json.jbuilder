json.extract! account, :id, :name, :currency, :multiplier, :created_at, :updated_at
json.url account_url(account, format: :json)