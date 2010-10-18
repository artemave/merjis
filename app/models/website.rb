require 'custom_validators'

class Website < ActiveRecord::Base
  class UniqPerUserValidator < ActiveModel::EachValidator
    def validate_each(record, attr, value)
      if( Website.joins(:users).where(
          :users => { :id.in => [ record.users.map(&:id) ] },
          :fqdn.eq => value,
          :id.not_eq => record.id
        ).count > 0 )

        record.errors[attr] << "There is already website #{value} associated with this account"
      end
    end
  end

  has_and_belongs_to_many :users

  validates :users,
    :association_presence => true
  validates :fqdn,
    :presence => true,
    :uniq_per_user => true
end
