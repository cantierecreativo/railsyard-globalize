require 'blockenspiel'
require 'railsyard/globalize/dsl/nested_edit'
require 'railsyard-backend/config/nested_edit'

module Railsyard::Globalize::Config
  class NestedEdit < Railsyard::Backend::Config::NestedEdit

    def initialize(&block)
      super(:globalize, &block)
    end

    def render(form, context)
      locales = I18n.available_locales
      object = form.object

      # build a new translation for each locale if not existing
      locales.each do |locale|
        translation = object.translations.find do |translation|
          translation.locale.to_sym == locale.to_sym
        end
        object.translations.build(locale: locale) unless translation.present?
      end

      # language tabs
      tabs = context.content_tag(:ul) do
        I18n.available_locales.map do |locale|
          context.content_tag(:li) do
            context.content_tag(:a, I18n.t(:"railsyard.globalize.locale.#{locale}"), href:"##{locale}", data: { behaviour: "tab", tab_scope: "globalize" })
          end
        end.join.html_safe
      end

      # nested forms
      nested_form = form.simple_fields_for(:translations) do |subform|
        context.content_tag(:div, id: subform.object.locale) do
          groups.first.fields.map do |field|
            field.render(subform, context)
          end.join.html_safe
        end
      end

      context.content_tag(:div, class: "railsyard-globalize") do
        [
          tabs,
          nested_form
        ].join.html_safe
      end
    end

  end
end

# object = form.object
# association = object.class.reflect_on_association(name)

# nested_form = form.simple_fields_for(name) do |subform|
#   nested_form = context.render("railsyard/resources/nested_form", form: subform, config: self)
#   remove_field = context.content_tag(:div, class: "input remove-fields") do
#     subform.link_to_remove(context.destroy_label(subform.object), name, class: "button", data: { confirm: context.destroy_confirm_label })
#   end
#   [ nested_form, remove_field ].join.html_safe
# end

# add_new_field = form.link_to_add(context.new_label(association.klass), name, class: "button")

# [
#   nested_form,
#   add_new_field
# ].join.html_safe
