json.data do
  json.extract! order, :id, :subtotal, :tax, :notes, :total, :user_id,:address_lat, :address_long, :address_url, :user, :address, :user_full_name, :user_phone_number, :created_at, :updated_at
  json.status order.status.value
  json.order_items do
    json.array!(order.order_items) do |order_item|
      json.extract! order_item, :id, :unit_price, :quantity, :total_price
      json.quantity_type order_item.quantity_type.value
      json.slicing_type order_item.slicing_type.value

      json.product do
        json.partial! 'api/v1/products/product', product: order_item.product
      end
    end
  end
end
json.status @status
json.message @message if @message.present?