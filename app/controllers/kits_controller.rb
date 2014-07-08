class KitsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]

  def index
    if current_user.role == 'practitioner'
      @kits = Kit.includes(:client).where("practitioner_id = ?", current_user.id)

      if @kits.empty?
        flash[:notice] = "No clients found."
      end
    else
      @kit = Kit.find_or_create_by(client_id: current_user.id, practitioner_id: 1)
      redirect_to kit_path(@kit.id)
    end
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
