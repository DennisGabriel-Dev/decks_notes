class TaskQueue < ApplicationRecord
  belongs_to :notebook
  has_many :tasks
end
