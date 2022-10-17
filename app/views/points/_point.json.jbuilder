# frozen_string_literal: true

json.extract!(point, :id, :account_id, :event_id, :created_at, :updated_at)
json.url(point_url(point, format: :json))
