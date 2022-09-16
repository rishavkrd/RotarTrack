json.extract! account, :id, :UIN, :FirstName, :LastName, :PhoneNumber, :Email, :Status_id, :created_at, :updated_at
json.url account_url(account, format: :json)
