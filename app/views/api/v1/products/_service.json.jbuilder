json.id service.id
json.name service.name
json.desc service.description
json.phone service.phone

json.images do
  json.array! service.service_images do |image|
    json.image_url_small(asset_url(image.image(:medium)))
  end
end