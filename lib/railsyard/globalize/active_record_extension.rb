module Railsyard::Globalize
  module ActiveRecordExtension

    def railsyard_translates(*args, &block)
      attrs = args.dup.extract_options!
      translates(*args)
      translation_class.instance_eval &block
      translation_class.instance_eval do
        attr_accessible :locale
        attr_accessible *attrs
      end

      attr_accessible :translations_attributes
      accepts_nested_attributes_for :translations, allow_destroy: true
    end

  end
end

