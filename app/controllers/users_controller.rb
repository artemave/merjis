class UsersController < ApplicationController
  resources_controller_for :users

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User saved succesfully.'
      redirect_to :root
    else
      render :action => 'edit'
    end
  end
end
