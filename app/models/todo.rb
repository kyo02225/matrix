class Todo < ApplicationRecord
  belongs_to :user

  validates :title, :deadline, :urgency, :importance, presence: true
end
