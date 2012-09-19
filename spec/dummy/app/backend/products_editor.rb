Railsyard::Backend.define_editor_for Product do

  label :title

  list do
    field :sku
  end

  edit do
    field :sku
    group :translated_content do
      translate do
        field :title
        field :description
      end
    end
  end

end
