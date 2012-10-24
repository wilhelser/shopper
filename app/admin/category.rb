ActiveAdmin.register Category do
  action_item do
    link_to "New product", new_admin_category_product_path(category) if action_name == 'show'
  end
  
  index do
    column :name
    column :description
    default_actions
  end

  show title: :name do 
    attributes_table do 
      row :name
      row :description
      row "Cover" do |course|
        image_tag(category.cover, { size: '150x100', crop: 'fill' })
      end
    end

    panel "Product" do 
      table_for category.products do
        column "Cover" do |product|
          image_tag(product.cover, { size: '50x50', crop: 'fill' })
        end
        column "Name" do |product|
          link_to product.name, admin_category_product_path(category, product)
        end
        column :description
        column :quantity
        column :price
      end
    end
  end

  form partial: 'form'
end
