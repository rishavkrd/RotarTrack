# frozen_string_literal: true

json.extract!(account, :id, :UIN, :FirstName, :LastName, :PhoneNumber, :Email, :status_id, :created_at, :updated_at)
json.url(account_url(account, format: :json))
