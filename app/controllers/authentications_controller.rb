class AuthenticationsController < ApplicationController
  def destroy
    Authentication.destroy(params[:id])
    redirect_to :back
  end
end
