class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :comment, length: { minimum: 20 }
  validates :star, presence: true
end
