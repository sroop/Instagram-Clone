class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :posts
         has_many :likes
         has_many :hates
         has_many :comments

        has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
                     
		    has_many :following, :through => :relationships, :source => :followed

    def follow!(followed)
      self.relationships.create(followed_id: followed.id)
    end

    # def follow?(user)
    # end

    def unfollow!(followed)
      self.relationships.find_by(followed_id: followed.id).destroy
    end
end
