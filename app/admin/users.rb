ActiveAdmin.register User do
  permit_params :name, :email, :superadmin

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :superadmin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    user
  end

  filter :email
  filter :superadmin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :superadmin, :label => "Super Administrator"
    end
    f.actions
  end
end
