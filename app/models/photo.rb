class Photo < ActiveRecord::Base
	belongs_to :patient
	has_attached_file :image,
	                  :styles => {
	                        :thumb => "100x100#",
	                        :small  => "150x150>",
	                        :medium => "200x200" }
	validates_attachment :image, presence: true,
	                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
