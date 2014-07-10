class LandingController < ApplicationController
  def index
    if current_user
      redirect_to kits_path
    end
  end
end
