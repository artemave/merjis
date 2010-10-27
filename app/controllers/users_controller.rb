class UsersController < ApplicationController
  resources_controller_for :users
  load_and_authorize_resource

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User saved succesfully.'
      redirect_to users_root_url
    else
      render :action => 'edit'
    end
  end
end
