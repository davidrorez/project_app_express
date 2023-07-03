json.client do
    json.id @client.id
    json.email @client.email
    json.first_name @client.first_name
    json.last_name @client.last_name
    json.physical_address @client.physical_address
    json.password @client.password
    json.state @client.state
    
end