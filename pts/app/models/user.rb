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
end
