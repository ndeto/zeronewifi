json.extract! ticket, :id, :code, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
