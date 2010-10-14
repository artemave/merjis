class Authentication < ActiveRecord::Base
  belongs_to :user

  before_destroy :check_for_other_authentications

  private
    
    def check_for_other_authentications
      if user.authentications.count(:conditions => "id <> #{id}") == 0
        errors.add(:base, "Can't delete the only OpenID for the account")
      end

      errors.empty?
    end
end
