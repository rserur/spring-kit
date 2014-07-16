class KitsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]
  before_action :authenticate_user!

  def index
   if current_user.practitioner?
    @kits = Kit.includes(:client).where("practitioner_id = ?", current_user.id)
    @messages = Post.where("message = ? AND recipient_id = ?", true, current_user.id)
    if @kits.empty?
      flash[:alert] = "No clients found."
    end
  else
    @kit = Kit.find_by client_id: current_user.id

    if @kit
      redirect_to kit_path(@kit.id)
    else
      redirect_to edit_user_registration_path
    end
  end
  end

  def show
    @post = Post.new

    if params[:collection]
      @kit = Kit.find(params[:kit_id])
      @posts = @kit.posts.order(created_at: :desc).tagged_with(params[:collection])
    else
      @kit = Kit.find(params[:id])
      @posts = @kit.posts.order(created_at: :desc)
    end

    @message = Post.where("message = ? AND recipient_id = ?", true,
                              current_user.id).last

    @collections = @kit.owned_tags
  end

  def new
    @kit = Kit.new

    @clients = User.where(organization_id: current_user.organization_id, role: 'client')
  end

  def create
    @kit = Kit.new(kit_params)
    @kit.practitioner_id = current_user.id

    if @kit.save
      redirect_to @kit, notice: 'Kit successfully created.'
    else
      render :new, notice: 'Failed to created kit.'
    end
  end

  def destroy
    @kit = Kit.find(params[:id])
    @kit.destroy

    flash[:notice] = 'Kit deleted.'
    redirect_to kits_path
  end

  private

  def kit_params
    params.require(:kit).permit(:client_id)
  end

  def authorize_user
    unless user_signed_in? and current_user.practitioner?
      raise ActionController:RoutingError.new('Not Found')
    end
  end
end
