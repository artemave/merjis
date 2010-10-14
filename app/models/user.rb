class User < ActiveRecord::Base
  devise :rememberable, :trackable

  attr_accessible :email, :username

  has_many :authentications, :dependent => :delete_all

  validates :email,
    :presence => true,
    :email => true

  validates :username,
    :presence => true,
    :uniqueness => true
end
