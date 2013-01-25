class List < ActiveRecord::Base
  belongs_to :game
  attr_accessible :words
  validates :words, :presence => true
  validates :words, :uniqueness => true
  
  def self.random_word
    List.find(rand(List.count) + 1).words.upcase
  end
  
end
