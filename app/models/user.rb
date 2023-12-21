class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :favoritos, dependent: :destroy

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image

      # Create admin if the email matches an admin email
      user.admin = true if admin_emails.include?(user.email)
    end
    
  end


  def create_admin
    self.admin_attribute = true
  end


  def self.admin_emails
    ["leonardo20.nm@gmail.com", "admin2@example.com"]  # Replace with your actual admin email addresses
  end
end