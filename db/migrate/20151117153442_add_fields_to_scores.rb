class AddFieldsToScores < ActiveRecord::Migration
  def change
    add_column :scores, :score, :float, default: 0
    add_reference :scores, :user, index: true, foreign_key: true
    add_reference :scores, :word, index: true, foreign_key: true
  end
end
