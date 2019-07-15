json.data do
  json.array! @sliders do |slider|
    json.partial! 'api/v1/sliders/slider', slider: slider
  end
end
json.status @status
json.metaa do
  if not @sliders.nil?
    json.pagination do
      json.current_page @sliders.try(:current_page)
      json.total_pages @sliders.try(:total_pages)
      json.size @sliders.try(:size)
      json.total_count @sliders.try(:total_count)
    end
  end
end