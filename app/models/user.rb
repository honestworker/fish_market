# == Schema Information
#
# Table name: users
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
#  mobile_number          :string
#  verification_code      :string
#  is_mobile_verified     :boolean          default(FALSE)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_name              :string
#  auth_token             :string
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  address                :text
#  phone_number           :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  has_many :blogs

  devise :database_authenticatable, :lockable,
         :registerable, :recoverable, :rememberable,
         :trackable, :validatable, authentication_keys: [:mobile_number]

  validates_uniqueness_of :mobile_number, allow_nil: true
  validates_uniqueness_of :email, allow_blank: true
  validates :mobile_number, phone: {allow_blank: true, possible: false, types: [:mobile]}
  # validates :auth_token, uniqueness: true


  after_create :lock_user
  before_create :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def needs_mobile_number_verifying?
    if is_verified
      return false
    end
    if mobile_number.empty?
      return false
    end
    return true
  end

  def will_save_change_to_email?
    false
  end

  def email_required?
    false
  end

  def lock_user
    self.lock_access!
    self.verification_code = rand.to_s[2..5]
    send_sms
    self.save!
  end

  def send_sms
    RestClient.get 'http://www.hisms.ws/api.php?send_sms', {
        params: {
        username: '966558308096',
        password: 'majed123',
        numbers: self.mobile_number,
        sender:'Fish Day',
        message: "Your verification code is #{self.verification_code}.",
        date: Time.now.strftime("%Y-%m-%d") ,
        time: Time.now.strftime("%H:%M")}}
  end

  def unlock_user
    self.unlock_access!
    save
  end

  def last_incomplete_order
    last_order = orders.last
    if last_order.present?
      if last_order.status.delivered?
        orders.create
      else
        return last_order
      end
    else
      orders.create
    end
  end


  rails_admin do
    configure :password do 
      visible false
    end
    configure :password_confirmation do 
      visible false
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
    configure :verification_code do
      visible false
      help ''
    end
    configure :locked_at do
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
