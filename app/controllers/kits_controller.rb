class KitsController < ApplicationController
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
end
