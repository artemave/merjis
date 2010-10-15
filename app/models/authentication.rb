class Authentication < ActiveRecord::Base
  belongs_to :user

  after_destroy do |r|
    unless r.user.valid?
      r.errors.add(:base, r.user.errors.values.join("; "))
      raise ActiveRecord::Rollback
    end
  end
end
