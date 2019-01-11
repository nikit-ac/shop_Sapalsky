ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  permit_params :id, :title, :description, :price, :tag_list, :status, images_attributes: [:id, :image, :_destroy]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  # actions :all, except: :show

  index do
    selectable_column
    column :id
    column "Название", :title
    column "Описание", :description
    column "Цена", :price
    column "Статус", :status do |product|
      Product.statuses.key(product.status)
    end
    column "Добавлено", :created_at
    column "Обновлено", :updated_at
    actions
  end

  form do |f|
    f.inputs 'Подробнее' do
      f.input :title
      f.input :description#, as: :quill_editor
      f.input :price
      f.input :tag_list
      f.input :status, :as => :select, :collection => Product.statuses #({'Не показывать' => 1, 'Активный' => 2})


    end
    f.inputs :multipart => true do
      f.has_many :images, heading: 'Images',
                              allow_destroy: true,
                              new_record: true do |i|
        i.input :image, as: :file, hint: content_tag(:img, '', src: i.object.image.try(:url, :thumb))
        i.actions
      end
      f.actions
    end
  end


end
