json.extract! authentication, :id, :account_id, :password, :created_at, :updated_at
json.url authentication_url(authentication, format: :json)
