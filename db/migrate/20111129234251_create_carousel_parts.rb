class CreateCarouselParts < ActiveRecord::Migration
  def change
    create_table :refinery_carousel_parts do |t|
      t.string :title
      t.text :body
      t.integer :image_id
      t.integer :position

      t.timestamps
    end
  end
end
