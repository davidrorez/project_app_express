json.extract! client, :id, :email, :first_name, :last_name, :physical_address, :password, :created_at, :updated_at
json.url client_url(client, format: :json)
