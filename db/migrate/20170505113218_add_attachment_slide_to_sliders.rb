class AddAttachmentSlideToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :slide
    end
  end

  def self.down
    remove_attachment :sliders, :slide
  end
end
