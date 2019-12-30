class Context < ApplicationRecord
  has_many :todos
  # has_many :context_projects
  # has_many :projects, through: :context_projects
  belongs_to :user
end
