# == Schema Information
#
# Table name: sliders
#
#  id                 :integer          not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  link               :string
#  text               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Slider < ApplicationRecord

  has_attached_file :image
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
