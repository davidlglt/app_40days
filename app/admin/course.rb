ActiveAdmin.register Course do
  permit_params :name, :content, :duration, :small_description, :total_words, :price, :video_teaser, :image

  show do |t|
    attributes_table do
      row :name
      row :content
      row :duration
      row :small_description
      row :total_words
      row :price
      row :video_teaser
      row :image do
        course.image? ? image_tag(course.image.url, height: '100') : content_tag(:span, "Vous n'avez pas ajouté d'image")
        end
      end
    end
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :name
        f.input :content
        f.input :duration
        f.input :small_description
        f.input :total_words
        f.input :price
        f.input :video_teaser
        f.input :image, hint: f.course.image? ? image_tag(course.image.url, height: '100') : content_tag(:span, "uplaod au format png, jpeg, gif")
    end
    f.actions
    end
  end
