class User < ActiveRecord::Base
  devise :rememberable, :trackable

  attr_accessible :email, :username

  has_many :authentications, :dependent => :delete_all

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :username
end
