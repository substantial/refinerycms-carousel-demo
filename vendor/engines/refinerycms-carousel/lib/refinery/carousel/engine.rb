require 'refinerycms-carousel'
require 'rails'

module Refinery
  module Carousel
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_carousel

      initializer "register refinery_carousel plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_carousel"
          plugin.url = app.routes.url_helpers.refinery_admin_carousel_parts_path
          plugin.menu_match = /^\/refinery\/carousel\/part/
          plugin.activity = {
            :class_name => :'refinery/carousel/part'
          }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Carousel)
      end

      config.to_prepare do
        ::ApplicationController.helper(Refinery::Carousel::CarouselHelper)
      end
    end
  end
end
