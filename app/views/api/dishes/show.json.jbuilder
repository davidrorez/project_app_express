json.dish do
    json.id @dish.id
    json.name @dish.name
    json.description @dish.description.body
    json.price @dish.price
    #json.photo @dish.photo
    json.state @dish.state
    
end