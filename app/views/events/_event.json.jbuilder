json.extract! event, :id, :Title, :Description, :Date, :Time, :Location, :Points, :created_at, :updated_at
json.url event_url(event, format: :json)
