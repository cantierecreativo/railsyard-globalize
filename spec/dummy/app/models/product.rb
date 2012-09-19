class Product < ActiveRecord::Base
  attr_accessible :sku
  railsyard_translates :title, :description do
    validates_presence_of :title
  end
end
