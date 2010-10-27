require 'custom_validators'

class Website < ActiveRecord::Base

  attr_accessible :fqdn, :name, :description, :main, :video, :images, :mobile

  belongs_to :user
  has_many :shares, :as => :resource, :dependent => :destroy
  has_many :crawls
  has_many :server_logs

  validates :user,
    :association_presence => true
  validates :fqdn,
    :presence => true,
    :uniqueness => {:scope => :user_id}

  def categories
    [:main, :images, :video, :mobile].select{ |c| send(c) }
  end
end
