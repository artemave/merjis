class Authentication < ActiveRecord::Base
  belongs_to :user

  def destroy
    raise 'Destroy authentications though associated user'
  end
end
