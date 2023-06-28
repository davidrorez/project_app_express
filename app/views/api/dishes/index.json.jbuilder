json.array! @dishes do |dish|
    json.id dish.id
    json.name dish.name
    json.description dish.description.body
    json.price dish.price
    json.photo_url url_for(dish.photo) if dish.photo.attached? 
    json.state dish.state
  end
  