# Railsyard::Globalize

Makes it easy to translate your resource fields.

## Installation

1. Gemfile:

```ruby
gem "railsyard-globalize"
```

2. Inizialize Globalize

4. Your model

```ruby
railsyard_translates :title, :description do
  validates_presence_of :title
end
```

3. Backend configuration (e.g. app/backend/editor_for_books.rb):

```ruby
edit do
  # ...
  translates do
    field :title
    field :description
  end
end
```
