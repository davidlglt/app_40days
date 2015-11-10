class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :video_teaser

      t.timestamps null: false
    end
  end
end
