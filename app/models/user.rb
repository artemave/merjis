require 'custom_validators'

class User < ActiveRecord::Base

  devise :rememberable, :trackable

  attr_accessible :email, :username

  has_many :authentications, :dependent => :destroy
  has_many :websites, :dependent => :destroy
  has_many :own_shares, :foreign_key => :owner_id, :dependent => :destroy
  has_many :shares, :foreign_key => :receiver_id, :readonly => true
  has_and_belongs_to_many :roles

  validates :email,
    :presence => true,
    :email => {:message => "does not appear to be valid"}
  validates :username,
    :presence => true,
    :uniqueness => true
  validates :authentications,
    :association_presence => { :message => "There must be at least one OpenID associated with account", :on => :update }


  def is?(role)
    # TODO switch to role_model gem
    roles.map(&:name).include?(role.to_s)
  end
end
