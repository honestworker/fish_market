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

require 'test_helper'

class TeamMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
