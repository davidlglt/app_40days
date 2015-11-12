class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :comment, length: { minimum: 10 }
  validates :star, presence: true
end
