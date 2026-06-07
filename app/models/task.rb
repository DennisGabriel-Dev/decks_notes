class Task < ApplicationRecord
  belongs_to :task_queue
  belongs_to :user
  has_many :comments
end
