class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :comment, presence: true #, length: { minimum: 10 }
  validates :star, presence: true

  scope :by_user, -> (user) { where(user: user) }
end
