json.data do
  json.array! @products do |product|
    json.partial! 'api/v1/products/product', product: product
  end
end
json.status @status
json.metaa do
  if not @products.nil?
    json.pagination do
      json.current_page @products.try(:current_page)
      json.total_pages @products.try(:total_pages)
      json.size @products.try(:size)
      json.total_count @products.try(:total_count)
    end
  end
end