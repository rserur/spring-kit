class KitsController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :delete]

  def index
    if current_user.practitioner?
      @kits = Kit.includes(:client).where("practitioner_id = ?", current_user)
      @msgs = Post.where("message = true AND recipient_id = ?", current_user)
      if @kits.empty?
        flash[:alert] = "No clients found."
      end
    else
      @kit = Kit.find_by client_id: current_user
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
      @posts = @kit.posts.order(created_at: :desc).
      tagged_with(params[:collection]).uniq
    elsif params[:search]
      @kit = Kit.find(params[:id])
      @posts = Post.search(params[:search][:terms], @kit)
    else
      @kit = Kit.find(params[:id])
      @posts = @kit.posts.order(created_at: :desc)
    end

    @msg = Post.where("message = true AND recipient_id = ?", @kit.client_id).last

    @collections = @kit.owned_tags
  end

  def new
    @kit = Kit.new
    @current_org = current_user.organization_id

    @clients = User.where(organization_id: @current_org, role: 'client')
  end

  def create
    @kit = Kit.new(kit_params)
    @kit.practitioner_id = current_user.id

    if @kit.save
      redirect_to @kit, notice: 'Kit successfully created.'
    else
      redirect_to new_kit_path, notice: 'Failed to create kit. Does the client already have one?'
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
    unless user_signed_in? && current_user.practitioner?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
