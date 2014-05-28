class Post < ActiveRecord::Base

	has_many :comments
	belongs_to :user

	has_attached_file :picture, :styles => { :medium => "300x300>" }, :default_url => "image.jpg"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
