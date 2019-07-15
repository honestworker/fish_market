# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def name
    self[:email]
  end

  rails_admin do
    configure :email do
      help 'Required'
    end
    configure :password do 
      help 'Required'
    end
    configure :password_confirmation do 
      help 'Required'
    end
    configure :encrypted_password  do
      visible false
    end
    configure :reset_password_token do
      visible false
    end
    configure :reset_password_sent_at do
      visible false
      help ''
    end
    configure :remember_created_at do
      visible false
      help ''
    end
    configure :sign_in_count do
      visible false
      help ''
    end
    configure :current_sign_in_at do
      visible false
      help ''
    end
    configure :last_sign_in_at do
      visible false
      help ''
    end
  end
end
