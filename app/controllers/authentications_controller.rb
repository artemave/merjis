class AuthenticationsController < ApplicationController
  def destroy
    auth = Authentication.find(params[:id])

    if auth.destroy
      flash[:notice] = "OpenID deleted"
    else
      flash[:alert] = auth.errors.values.join("\n")
    end

    redirect_to :back
  end
end
