class Lesson < ActiveRecord::Base
  belongs_to :course
  acts_as_list scope: :course

  validates :name, presence: true, length: { maximum: 50}
  validates :video, presence: true
  validates :tag, presence: true
  validates :course, presence: true

  def next
    course.lessons.where("position > ? AND header = ?", position, false).order(:tag).first
  end

  def prev
    course.lessons.where("tag < ? AND header = ?", tag, false).order(:tag).last
  end
end
