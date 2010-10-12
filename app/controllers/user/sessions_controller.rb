class User::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :except => [:destroy]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    user = User.find_or_create_by_uid_and_email(auth_hash['uid'], auth_hash['user_info']['email'])
    sign_in user
    redirect_to :root
  end

  def destroy
    sign_out current_user
    redirect_to :root
  end
end
