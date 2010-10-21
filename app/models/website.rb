require 'custom_validators'

class Website < ActiveRecord::Base

  attr_accessible :fqdn, :name, :description

  belongs_to :user
  has_many :crawls
  has_many :server_logs

  validates :user,
    :association_presence => true
  validates :fqdn,
    :presence => true,
    :uniqueness => {:scope => :user_id}
end
