module Refinery
  ::Refinery::Page.reset_column_information

  page_position = -1

  unless ::Refinery::Page.where(:menu_match => "^/$").any?
    home_page = ::Refinery::Page.create!({:title => "Home",
                :deletable => false,
                :link_url => "/",
                :menu_match => "^/$",
                :position => (page_position += 1)})
    home_page.parts.create({
                  :title => "Body",
                  :body => <<-BODY,
<p>This is a demo Refinery CMS application for the refinerycms-carousel gem.</p>\r\n<p>You can look at the source for <a title=\"http://github.com/substantial/refinerycms-carousel\" href=\"http://github.com/substantial/refinerycms-carousel\">refinerycms-carousel</a> and <a title=\"http://github.com/substantial/refinerycms-carousel-demo\" href=\"http://github.com/substantial/refinerycms-carousel-demo\">this demo application</a> on github.</p>
BODY
                  :position => 0
                })

    home_page_position = -1
    page_not_found_page = home_page.children.create(:title => "Page not found",
                :menu_match => "^/404$",
                :show_in_menu => false,
                :deletable => false,
                :position => (home_page_position += 1))
    page_not_found_page.parts.create({
                  :title => "Body",
                  :body => "<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>",
                  :position => 0
                })
  else
    page_position += 1
  end
end
