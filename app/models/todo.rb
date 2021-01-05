class Todo < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates_inclusion_of :completed, :in => [true, false]
end
