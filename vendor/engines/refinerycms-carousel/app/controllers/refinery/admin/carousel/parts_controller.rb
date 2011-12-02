module ::Refinery
  module Admin
    module Carousel
      class PartsController < ::Refinery::AdminController

        crudify 'refinery/carousel/part', :xhr_paging => true

      end
    end
  end
end
