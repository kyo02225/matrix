class Todo < ApplicationRecord
  belongs_to :user

  validates :title, :status, :deadline, :urgency, :importance, presence: true

  def self.search(search)
    return Todo.all unless search
    Todo.where(['title LIKE ?', "%#{search}%"])
  end
end
