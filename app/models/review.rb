class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :comment, presence: true #, length: { minimum: 10 }
  validates :star, presence: true
end
