class OtherService < ApplicationRecord
  validates_presence_of :name, :phone, :description

  has_many :service_images, inverse_of: :other_service, dependent: :destroy
  accepts_nested_attributes_for :service_images, allow_destroy: true
end
