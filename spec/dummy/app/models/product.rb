class Product < ActiveRecord::Base
  railsyard_translates :title, :description do
    validates_presence_of :title
  end
end
