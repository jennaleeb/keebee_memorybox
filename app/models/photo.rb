class Photo < ActiveRecord::Base
	belongs_to :patient
	has_attached_file :image,
	                  styles: { thumb: ["64x64#", :jpg] }
	validates_attachment :image, presence: true,
	                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
