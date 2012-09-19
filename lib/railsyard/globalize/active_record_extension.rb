module Railsyard::Globalize
  module ActiveRecordExtension

    def railsyard_translates(*args, &block)
      translates(*args)
      translation_class.instance_eval &block
      translation_class.instance_eval do
        attr_accessible :locale
      end

      attr_accessible :translations_attributes
      accepts_nested_attributes_for :translations, allow_destroy: true
    end

  end
end

