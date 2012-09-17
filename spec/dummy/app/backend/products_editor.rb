Railsyard::Backend.define_editor_for Product do

  label :title

  list do
    field :sku
  end

  edit do
    field :sku
    translate do
      field :title
      field :description
    end
  end

end
