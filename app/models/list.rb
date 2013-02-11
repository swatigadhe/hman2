class List < ActiveRecord::Base
  belongs_to :game
  attr_accessible :words, :hint, :photo
  validates :words, :presence => true
  validates :words, :uniqueness => true
  validates :hint, :presence => true
  validates :hint, :uniqueness => true

  has_attached_file :photo,
  :styles => {
    :thumb=> "100x100#",
    :small  => "250x250>",
    :medium => "300x300>",
    :large =>   "400x400>" }
    
    
  def self.random_word
    List.find(rand(List.count) + 1).words.upcase
  end
  
end
