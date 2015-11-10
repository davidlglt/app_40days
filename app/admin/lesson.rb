ActiveAdmin.register Lesson do
  permit_params :name, :note, :video, :header, :tag, :course_id

  sortable tree: false,
                  sorting_attribute: :tag

  index :as => :sortable do
    label :name

    actions
  end

  index do
    selectable_colum
    colum :header
    colum :title
    colum :tag
    colum :course

    actions
  end
end

