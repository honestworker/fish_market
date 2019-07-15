# == Schema Information
#
# Table name: abouts
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class About < ApplicationRecord
  translates :body
  rails_admin do
    field :body do
      tabbed true
    end
  end
end
