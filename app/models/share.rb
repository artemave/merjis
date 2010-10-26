class Share < ActiveRecord::Base
  belongs_to :resource,
    :polymorphic => true
  belongs_to :owner,
    :class_name => 'User',
    :foreign_key => :owner_id
  belongs_to :receiver,
    :class_name => 'User',
    :foreign_key => :receiver_id,
    :readonly => true

  validates :receiver,
    :presence => true
  validates :resource,
    :presence => true

end
