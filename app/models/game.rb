class Game < ActiveRecord::Base
  attr_accessible :gamename
  has_many :lists, :dependent => :destroy
  validates :gamename, :presence => true
  has_many :usergames
  has_many :users, :through => :usergames
  
    
 
end
