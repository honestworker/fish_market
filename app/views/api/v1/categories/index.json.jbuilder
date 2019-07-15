json.data do
  json.array!(@categories) do |category|
    json.partial! 'api/v1/categories/category', category: category
  end
end
json.metaa do
  if not @categories.nil?
    json.pagination do
      json.current_page @categories.try(:current_page)
      json.total_pages @categories.try(:total_pages)
      json.size @categories.try(:size)
      json.total_count @categories.try(:total_count)
    end
  end
end
