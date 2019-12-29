class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true
  belongs_to :context, optional: true

  validates :title, :deadline, :urgency, :importance, presence: true
end
