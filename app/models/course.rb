class Course < ActiveRecord::Base
  has_many :lessons
  has_many :reviews, dependent: :destroy
  has_many :subscriptions
  has_many :user, through: :subscriptions

  validates :name, presence: true, length: { maximum: 50}
  validates :content, presence: true, length: { maximum: 500}
  validates :price, presence: true, numericality: { only_integer: true}

  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "170x75#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def average_rating
    reviews.blank? ? 0 : reviews.average(:star).round(2)
  end

end
