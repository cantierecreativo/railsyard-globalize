require 'railsyard/globalize/engine'
require 'railsyard/globalize/dsl/edit_extension'
require 'railsyard-backend/dsl/edit'

module Railsyard
  module Globalize
  end
end

Railsyard::Backend::Dsl::Edit.include Railsyard::Globalize::Dsl::EditExtension
