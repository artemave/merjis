class User < ActiveRecord::Base
  devise :rememberable, :trackable

  attr_accessible :email, :username

  has_many :authentications

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :username
end
