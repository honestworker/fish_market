json.data do
  json.array!(@services) do |service|
    json.partial! 'api/v1/products/service', service: service
  end
end
json.metaa do
  if not @services.nil?
    json.pagination do
      json.current_page @services.try(:current_page)
      json.total_pages @services.try(:total_pages)
      json.size @services.try(:size)
      json.total_count @services.try(:total_count)
    end
  end
end
