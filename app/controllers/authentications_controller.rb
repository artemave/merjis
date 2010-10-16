class AuthenticationsController < ApplicationController
  load_and_authorize_resource

  def destroy
    if @authentication.destroy
      flash[:notice] = "OpenID deleted"
    else
      flash[:alert] = @authentication.errors.values.join("\n")
    end

    redirect_to :back
  end
end
