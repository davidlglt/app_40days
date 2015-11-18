class RemoveSkuFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :sku, :string
  end
end
