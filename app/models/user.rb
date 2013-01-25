class User < ActiveRecord::Base
  attr_accessible :email_id, :name, :game_ids
   validates :email_id, :presence => true, :uniqueness => true
   has_many :usergames
  has_many :games, :through => :usergames
end
