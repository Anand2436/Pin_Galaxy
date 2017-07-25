class AddAttachmentImageToBadges < ActiveRecord::Migration[5.1]
  def self.up
    change_table :badges do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :badges, :image
  end
end
