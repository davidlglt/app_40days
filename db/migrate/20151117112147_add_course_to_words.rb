class AddCourseToWords < ActiveRecord::Migration
  def change
    add_reference :words, :course, index: true, foreign_key: true
  end
end
