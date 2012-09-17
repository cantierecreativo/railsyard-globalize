module Railsyard::Globalize::Dsl
  module EditExtension

    def translate(options = {}, &block)
      require 'railsyard/globalize/config/nested_edit'
      require 'railsyard-backend/config/edit_field'
      group = Railsyard::Globalize::Config::NestedEdit.new(&block)
      locale_field = Railsyard::Backend::Config::EditField.new(:locale, as: :hidden)
      group.add_field_to_default_group(locale_field)
      config.add_group(group)
    end

  end
end
