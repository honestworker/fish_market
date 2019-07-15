# == Schema Information
#
# Table name: product_images
#
#  id                 :integer          not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string
#  product_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProductImage < ApplicationRecord
  belongs_to :product, inverse_of: :product_images, optional: true

  has_attached_file :image, styles: {thumb: '100x100>', square: '200x200#', medium: '300x300>' }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  rails_admin do
    edit do
      configure :product do
        hide
      end
    end
  end
end
