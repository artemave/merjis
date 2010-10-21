class Share < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  belongs_to :user
  belongs_to :receiver,
    :class_name => 'User',
    :foreign_key => :receiver_id,
    :readonly => true
end
