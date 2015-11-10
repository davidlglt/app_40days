ActiveAdmin.register Lesson do
  permit_params :name, :note, :video, :header, :tag, :course_id

  sortable tree: false,
                  sorting_attribute: :tag

  index :as => :sortable do
    label :name

    actions
  end

  index do
    selectable_column
    column :header
    column :title
    column :tag
    column :course

    actions
  end
end

