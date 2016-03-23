class Game < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :longname
  has_many :playerranks
  has_many :tournaments
end
