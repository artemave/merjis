class Share < ActiveRecord::Base
  attr_accessible :receiver_id

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
  validates :owner,
    :presence => true

  validate :owner_is_not_receiver
  validate :unique_share

  private

    def owner_is_not_receiver
      errors.add(:base, "It is not allowed to share with yourself") if owner == receiver
    end

    def unique_share
      if Share.where(:receiver_id => receiver.try(:id), :owner_id => owner.try(:id), :resource_id => resource.try(:id), :id.not_eq => try(:id)).first.present?
        errors.add(:base, "It is not allowed to share the same resource twice with the same user")
      end
    end
end
