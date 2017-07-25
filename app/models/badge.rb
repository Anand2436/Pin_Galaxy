class Badge < ApplicationRecord
	acts_as_votable
	belongs_to :user

	has_attached_file :image, styles: { medium: "320x300>", thumb: "200x200>" }, default_url: "/images/:style/missing.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
