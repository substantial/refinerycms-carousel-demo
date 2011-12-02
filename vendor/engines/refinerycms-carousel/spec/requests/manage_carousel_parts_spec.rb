require "spec_helper"

describe "manage carousel parts" do
  login_refinery_user

  describe "index" do
    before(:each) do
      FactoryGirl.create(:carousel_part, :title => "UniqueTitleOne")
      FactoryGirl.create(:carousel_part, :title => "UniqueTitleTwo")
    end

    it "shows two items" do
      visit refinery_admin_carousel_parts_path
      page.should have_content("UniqueTitleOne")
      page.should have_content("UniqueTitleTwo")
    end
  end

  describe "create" do
    before(:each) do
      visit refinery_admin_carousel_parts_path

      click_link "Add New Carousel Part"
    end

    context "valid data" do
      it "should succeed" do
        fill_in "Title", :with => "This is a test of the first string field"
        click_button "Save"

        page.should have_content("'This is a test of the first string field' was successfully added.")
        Refinery::Carousel::Part.count.should == 1
      end
    end

    context "invalid data" do
      it "should fail" do
        click_button "Save"

        page.should have_content("Title can't be blank")
        Refinery::Carousel::Part.count.should == 0
      end
    end

    context "duplicate" do
      before(:each) { FactoryGirl.create(:carousel_part, :title => "UniqueTitle") }

      it "should fail" do
        visit refinery_admin_carousel_parts_path

        click_link "Add New Carousel Part"

        fill_in "Title", :with => "UniqueTitle"
        click_button "Save"

        page.should have_content("There were problems")
        Refinery::Carousel::Part.count.should == 1
      end
    end
  end

  describe "edit" do
    before(:each) { FactoryGirl.create(:carousel_part, :title => "A title") }

    it "should succeed" do
      visit refinery_admin_carousel_parts_path

      within ".actions" do
        click_link "Edit this carousel part"
      end

      fill_in "Title", :with => "A different title"
      click_button "Save"

      page.should have_content("'A different title' was successfully updated.")
      page.should have_no_content("A title")
    end
  end

  describe "destroy" do
    before(:each) { FactoryGirl.create(:carousel_part, :title => "UniqueTitleOne") }

    it "should succeed" do
      visit refinery_admin_carousel_parts_path

      click_link "Remove this carousel part forever"

      page.should have_content("'UniqueTitleOne' was successfully removed.")
      Refinery::Carousel::Part.count.should == 0
    end
  end

end
