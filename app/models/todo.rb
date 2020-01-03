class Todo < ApplicationRecord
  belongs_to :user

  validates :title, :status, :deadline, :urgency, :importance, presence: true
end
