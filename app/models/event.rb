class Event < ApplicationRecord
  validates :name, :location, :date, presence: true
  has_many :event_users, foreign_key: :attended_event_id
  has_many :attendees, through: :event_users, source: :event_attendee
  belongs_to :creator, class_name: "User"

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }
end