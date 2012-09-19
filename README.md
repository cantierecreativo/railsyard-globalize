# Railsyard::Globalize

Makes it easy to translate your resource fields.

## Installation

```ruby
gem "railsyard-globalize"
```
## Your model

```ruby
railsyard_translates :title, :description do
  validates_presence_of :title
end
```
## Editor configuration

```ruby
edit do
  # ...
  translates do
    field :title
    field :description
  end
end
```
