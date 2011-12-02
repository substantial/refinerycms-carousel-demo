module Refinery
  module Carousel
    module CarouselHelper
      def carousel &block
        render :layout => 'refinery/carousel', locals: { parts: carousel_parts } do |part|
          if block_given?
            capture(part, &block)
          else
            render 'refinery/carousel/part', part: part
          end
        end
      end

      def carousel_parts
        @carousel_parts = Refinery::Carousel::Part.all.to_a
      end
    end
  end
end
