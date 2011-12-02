module Refinery
  module Carousel
    class Part < ActiveRecord::Base
      acts_as_indexed :fields => [:title, :body]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image
    end
  end
end
