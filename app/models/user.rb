class User < ActiveRecord::Base
  validates_presence_of :email, :username, :password
  validates_uniqueness_of :username, :email

  has_many :favorites
  has_many :movies, through: :favorites

  has_secure_password
end
