ActiveAdmin.register Lesson do
  permit_params :name, :note, :video, :header, :tag, :course_id
end

