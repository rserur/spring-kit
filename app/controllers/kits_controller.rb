class KitsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]

  def index
    @kits = Kit.limit(50)
  end

  def show
    @kit = Kit.find(params[:id])
  end

  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(kit_params)

    if @kit.save
      redirect_to @kit, notice: 'Kit successfully created.'
    else
      render :new, notice: 'Failed to created kit.'
    end
  end

  private

  def kit_params
    params.require(:kit).permit(:client_id, :practitioner_id)
  end

  def authorize_user
    unless user_signed_in? and current_user.practitioner?
      raise ActionController:RoutingError.new('Not Found')
    end
  end
end
