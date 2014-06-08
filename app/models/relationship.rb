class Relationship < ActiveRecord::Base

  # attr_accessible :followed_id
  
  belongs_to :follower
  belongs_to :followed
end
