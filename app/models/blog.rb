# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  body               :text
#  admin_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Blog < ApplicationRecord
  translates :title, :body

  belongs_to :admin

  validates :body, :title, presence: true
  has_attached_file :image
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  rails_admin do
    configure :title do
      tabbed true
    end
    configure :body do
      tabbed true
    end
    configure :admin do
      visible true
      inline_add false
      inline_edit false
    end
  end
end
