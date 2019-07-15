class ServiceImage < ApplicationRecord
  belongs_to :other_service, inverse_of: :service_images, optional: true

  has_attached_file :image, styles: {thumb: '100x100>', square: '200x200#', medium: '300x300>' }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :image

  rails_admin do
    edit do
      configure :other_service do
        hide
      end
    end
  end
end
