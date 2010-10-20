require 'custom_validators'

class Website < ActiveRecord::Base

  belongs_to :user
  has_many :crawls
  has_many :server_logs

  validates :user,
    :association_presence => true
  validates :fqdn,
    :presence => true,
    :uniqueness => {:scoped_to => :user_id}
end
