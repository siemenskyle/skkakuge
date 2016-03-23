class Tournament < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :date
  belongs_to :game
  has_many :tourneyresults
end
