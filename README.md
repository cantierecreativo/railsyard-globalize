# Railsyard::Globalize

Add a Globalize attachment to your backend resource.


## Installation

1. Gemfile:

        gem "railsyard-globalize"

2. Configure Globalize initializer and migration (see https://github.com/markevans/globalize)

3. Backend configuration (e.g. app/backend/editor_for_books.rb):

        field :image, as: :globalize do
          input_options components: [ :preview, :upload, :url, :remove ] # use any of these
        end