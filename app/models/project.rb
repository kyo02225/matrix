class Project < ApplicationRecord
  has_many :todos
  # has_many :context_projects
  # has_many :contexts, through: :context_projects
  belongs_to :user
end
