ActiveAdmin.register Category do
  permit_params :id, :name
  form do |f|
    f.inputs 'Подробнее' do
      f.input :name
      f.input :ancestry, :as => :select, :collection => Category.roots
    end
    f.actions
  end

end
