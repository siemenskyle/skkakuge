class Tourneyresult < ActiveRecord::Base
  validates_presence_of :placing
  validates_presence_of :points
  belongs_to :tournament
  belongs_to :playerrank
end
