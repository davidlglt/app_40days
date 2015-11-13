class AddSmallDescriptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :small_description, :text
  end
end
