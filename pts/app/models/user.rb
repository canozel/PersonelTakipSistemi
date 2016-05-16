class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :missions
  scope :idle, -> { joins(:profile).where(state: false ).order("profiles.score desc").first }

  after_create :make_profile, on: :create

  def make_profile
    create_profile(
      score: "0"
      )
  end

  def full_name
    profile.first_name.to_s + " " + profile.last_name.to_s
  end

  def ensure_authentication_token
    self.authentication_token = generate_authentication_token
    self.save!
    self.authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
