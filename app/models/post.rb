class Post < ActiveRecord::Base

	has_many :comments
	belongs_to :user
	has_many :likes
	has_and_belongs_to_many :tags

	has_attached_file :picture, :styles => { :medium => "300x300>" }, storage: :s3, s3_credentials: {
		bucket: 'Instagram-Clone-Makers-Academy',
		access_key_id: Rails.application.secrets.s3_access_key,
		secret_access_key: Rails.application.secrets.s3_secret_key
	}

  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
    

  	def tag_name
  		""
  	end

  	def tag_name=(name)
  		return if name.blank?

  		name.split(', ').uniq.each do |tag|
  			tagg = Tag.find_or_create_by(name: '#' + tag.delete('#'))
  			self.tags << tagg
  		end

  	end

end




