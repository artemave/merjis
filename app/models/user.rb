class User < ActiveRecord::Base
  devise :rememberable, :trackable

end
