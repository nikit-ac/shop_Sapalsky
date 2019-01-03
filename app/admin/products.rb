ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  permit_params :id, :title, :description, :price, :status, images_attributes: [:id, :image, :_destroy]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  # actions :all, except: :show

  # index do
  #   column "История", :content do |content|
  #     raw(content.content)
  #   end
  #   column "Добавлено", :created_at
  #   column "Обновлено", :updated_at
  #   actions
  # end

  form do |f|
    f.inputs 'Подробнее' do
      f.input :title
      f.input :description#, as: :quill_editor
      f.input :price
      f.input :status, :as => :select, :collection => ({'Не показывать' => 1, 'Активный' => 2})

       # Product.status_hash {|p| []}
    end
    f.inputs :multipart => true do
      f.has_many :images, heading: 'Images',
                              allow_destroy: true,
                              new_record: true do |i|
        i.input :image, as: :file#, hint: image_tag(i.object.image.try(:url, :thumb))
        i.actions
      end
      f.actions
    end
  end


end
