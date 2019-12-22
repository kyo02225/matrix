class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :context
end
