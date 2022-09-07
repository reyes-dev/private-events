class User < ApplicationRecord
  validates :username, uniqueness: true
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :event_users, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:username]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end