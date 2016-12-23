class Movie < ActiveRecord::Base


  has_many :favorites
  has_many :favoritors, through: :favorites, source: :user
end
