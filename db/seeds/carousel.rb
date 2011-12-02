parts = YAML.load(<<-PARTS)
---
- :title: ! 'Cosby sweater high life blog brooklyn, carles helvetica shoreditch locavore
    lo-fi photo booth master cleanse. '
  :body: ! "<ul><li>Four loko ethical DIY stumptown etsy cosby sweater.</li>\r\n<li>Leggings
    master cleanse dreamcatcher, fap before they sold out 3 wolf moon ethical.</li>\r\n<li>Carles
    gluten-free mixtape squid.</li>\r\n<li>Brooklyn keytar salvia, echo park put a
    bird on it vegan you probably haven't heard of them stumptown keffiyeh.</li>\r\n<li>Brooklyn
    trust fund brunch echo park thundercats wolf, jean shorts biodiesel PBR banh mi.</li>\r\n<li>Brunch
    scenester salvia, artisan wolf banksy mixtape.</li>\r\n</ul>"
  :position: 0
  :image: food-640-250.jpg
- :title: Aesthetic +1 farm-to-table, cliche master cleanse mustache cardigan etsy
    cred wayfarers.
  :body: ! "<ul><li>Thundercats cliche cred art party Austin blog.</li>\r\n<li>Pitchfork
    cred artisan farm-to-table, master cleanse aesthetic tattooed chambray.</li>\r\n<li>Keytar
    VHS art party, 8-bit carles you probably haven't heard of them whatever shoreditch
    american apparel letterpress before they sold out seitan hoodie.</li>\r\n<li>Whatever
    food truck organic 3 wolf moon, carles retro viral cliche freegan next level.</li>\r\n<li>Squid
    american apparel artisan, seitan mcsweeney's 3 wolf moon portland vice cosby sweater
    before they sold out brooklyn organic echo park fixie thundercats.</li>\r\n<li>Four
    loko iphone keytar photo booth.</li>\r\n</ul>"
  :position: 1
  :image: city-640-250.jpg
- :title: Lo-fi readymade wayfarers, scenester shoreditch thundercats Austin sartorial
    dreamcatcher wolf iphone.
  :body: <div class="carousel-image"><img src="http://placekitten.com/640/150" /></div>
  :position: 2
  :image: nightlife-640-250.jpg
PARTS

if Refinery::Carousel::Part.count == 0
  parts.each do |part|
    path = Rails.root + 'app/assets/images/' + part[:image]
    part[:image] = Refinery::Image.create!(:image => path)

    Refinery::Carousel::Part.create! part
  end
end
