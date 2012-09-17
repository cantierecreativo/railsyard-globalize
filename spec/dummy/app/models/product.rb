class Product < ActiveRecord::Base
  attr_accessible :sku
  translates :title, :description
  accepts_nested_attributes_for :translations, allow_destroy: true

  class Translation < Globalize::ActiveRecord::Translation
    validates_uniqueness_of :locale, scope: :product_id
    validates_presence_of :locale
    attr_accessible :locale, :title, :description

    def locale
      super rescue nil
    end

  end

end
