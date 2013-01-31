class List < ActiveRecord::Base
  belongs_to :game
  attr_accessible :words, :hint
  validates :words, :presence => true
  validates :words, :uniqueness => true
  validates :hint, :presence => true
  validates :hint, :uniqueness => true
  def self.random_word
    List.find(rand(List.count) + 1).words.upcase
  end
  
end
