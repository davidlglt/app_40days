class AddTotalWordsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :total_words, :integer
  end
end
