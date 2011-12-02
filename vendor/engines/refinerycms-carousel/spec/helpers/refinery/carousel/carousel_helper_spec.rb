require "spec_helper"

describe Refinery::Carousel::CarouselHelper do
  describe "#carousel" do
    before do
      helper.stub(:carousel_parts => carousel_parts)
    end

    subject do
      node_for(helper.carousel)
    end

    def node_for(html)
      Capybara::Node::Simple.new(html)
    end

    context "when no carousel parts exist" do
      let(:carousel_parts) { [] }

      it "returns an empty carousel container" do
        carousel = subject.find("ul#carousel")
        carousel.should_not have_selector("li")
      end
    end

    context "when carousel parts exist" do
      let(:carousel_parts) do
        %w[first middle last].map do |title|
          Factory.build(:carousel_part,
            :title => title,
            :body => "<p>#{title} body</p>" )
        end
      end

      it "returns the correct markup" do
        subject.should have_selector("li p", :text => 'first')
        subject.should have_selector("li p", :text => 'middle')
        subject.should have_selector("li p", :text => 'last')
      end

      it "returns the correct markup when called with a block" do
        i = 0
        html = helper.carousel do |part|
          content_tag :div, part.title, :id => "foo_#{i += 1}"
        end

        carousel = node_for(html)

        carousel.should have_selector("div#foo_1", :text => 'first')
        carousel.should have_selector("div#foo_2", :text => 'middle')
        carousel.should have_selector("div#foo_3", :text => 'last')
      end
    end
  end
end
