class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :reviews
  has_many :subscriptions, dependent: :destroy

  has_many :courses, through: :subscriptions
  has_many :words, through: :scores
  has_many :scores
  has_many :paid_subscriptions, -> { where(state: 'paid') }, class_name: 'Subscription'
  has_many :courses, through: :paid_subscriptions




  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end


  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }


  #after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
