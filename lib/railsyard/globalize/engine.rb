module Railsyard
  module Globalize
    class Engine < ::Rails::Engine

      initializer "Railsyard precompile hook" do |app|
        app.config.assets.precompile += [
          "railsyard/admin/railsyard_globalize.css",
          "railsyard/admin/railsyard_globalize.js"
        ]
      end

      config.to_prepare do
        Railsyard::Backend.plugin_manager.add_plugin(:globalize) do
          name "Globalize"
          backend_javascript_dependency "railsyard/admin/railsyard_globalize"
          backend_stylesheet_dependency "railsyard/admin/railsyard_globalize"
        end
      end
    end
  end
end
