class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :course, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :comment
      t.integer :star

      t.timestamps null: false
    end
  end
end
