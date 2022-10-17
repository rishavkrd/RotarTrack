# frozen_string_literal: true

json.extract!(event, :id, :Title, :Description, :Date, :Time, :Location, :Points, :type_id, :created_at, :updated_at)
json.url(event_url(event, format: :json))
