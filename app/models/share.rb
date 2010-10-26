class Share < ActiveRecord::Base
  cattr_accessor :owner

  belongs_to :resource,
    :polymorphic => true
  belongs_to :owner,
    :class_name => 'User'
  belongs_to :receiver,
    :class_name => 'User',
    :foreign_key => :receiver_id,
    :readonly => true

  def initialize(*args)
    super
    self.owner ||= @@owner
  end
end
