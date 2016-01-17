module Spectacle
  class Engine < ::Rails::Engine
    isolate_namespace Spectacle::Engine #Rails
    # initializer "foundation-rails.assets.precompile" do |app|
    #   app.config.assets.precompile += %w( vendor/modernizr.js )
    # end
  end
end
