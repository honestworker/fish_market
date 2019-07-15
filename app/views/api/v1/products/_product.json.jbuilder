json.extract! product, :id, :name, :desc, :kilo_price, :piece_price, :promotion_kilo_price, :promotion_piece_price, :category, :created_at, :updated_at

json.images do
  json.array! product.product_images do |image|
    json.image_url_small(asset_url(image.image(:medium)))
  end
end