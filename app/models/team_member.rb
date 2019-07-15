# == Schema Information
#
# Table name: team_members
#
#  id                 :integer          not null, primary key
#  name               :string
#  job_title          :string
#  summary            :text
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  order              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class TeamMember < ApplicationRecord
  translates :name, :job_title, :summary

  validates :name, :job_title, :order, presence: true
  validates :order, uniqueness: true, numericality: true

  has_attached_file :image, styles: {thumb: '100x100>', square: '200x200#', medium: '300x300>' }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  rails_admin do
    configure :name do
      tabbed true
    end
    configure :job_title do
      tabbed true
    end
    configure :summary do
      tabbed true
    end

  end
end
