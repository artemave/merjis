class WebsitesController < ApplicationController
  resources_controller_for :websites
  authorize_resource

  # POST /websites
  # POST /websites.xml
  def create
    @website = Website.new(params[:website])
    @website.user = current_user

    respond_to do |format|
      if @website.save
        format.html { redirect_to(@website, :notice => 'Website was successfully created.') }
        format.xml  { render :xml => @website, :status => :created, :location => @website }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @website.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def find_resources
      @websites = Website.accessible_by(current_ability).all
    end

    def find_resource
      @website = Website.accessible_by(current_ability).find(params[:id])
    end
end
