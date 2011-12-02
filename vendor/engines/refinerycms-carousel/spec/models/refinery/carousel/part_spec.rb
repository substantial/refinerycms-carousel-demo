require 'spec_helper'

describe ::Refinery::Carousel::Part do

  let(:attrs) { Factory.build(:carousel_part).attributes }

  before(:each) do
    Factory.create(:carousel_part, attrs)
  end

  context "validations" do

    it "rejects empty title" do
      attrs.merge! :title => ''
      described_class.new(attrs).should_not be_valid
    end

    it "rejects duplicate title" do
      # as one gets created before each spec by reset_carousel
      described_class.new(attrs).should_not be_valid
    end

  end
end
