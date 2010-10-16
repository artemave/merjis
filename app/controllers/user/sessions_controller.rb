class User::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :except => [:destroy]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    auth = Authentication.find_or_create_by_uid(auth_hash['uid'])
    auth.email = auth_hash['user_info']['email']

    if auth.user
      if current_user
        if auth.user != current_user
          flash[:alert] = "This OpenID is already used by account #{auth.user.username}"
        else
          flash[:notice] = "This OpenID is already assigned to this user. Nothing changed."
        end
        redirect_to :back
      else
        sign_in auth.user
        redirect_to :root
      end
    else
      if current_user
        current_user.authentications << auth
        auth.save!

        flash[:notice] = 'OpenID added'
        redirect_to :back
      else
        tmp_name = Time.now.to_i.to_s
        new_user = auth.create_user(:username => tmp_name, :email => auth_hash['user_info']['email'])
        auth.save!

        sign_in new_user
        redirect_to edit_user_path(new_user)
      end
    end
  end

  def destroy
    sign_out current_user
    redirect_to :root
  end
end
