require 'railsyard/globalize/engine'
require 'railsyard/globalize/dsl/edit_extension'
require 'railsyard/globalize/dsl/edit_group_extension'
require 'railsyard/globalize/active_record_extension'
require 'railsyard-backend/dsl/edit'

module Railsyard
  module Globalize
  end
end

Railsyard::Backend::Dsl::Edit.include Railsyard::Globalize::Dsl::EditExtension
Railsyard::Backend::Dsl::EditGroup.include Railsyard::Globalize::Dsl::EditGroupExtension
ActiveRecord::Base.send :extend, Railsyard::Globalize::ActiveRecordExtension
