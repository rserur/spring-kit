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
      @kit = Kit.find_or_create_by(client_id: current_user.id)
      redirect_to kit_path(@kit.id)
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

    @collections = @kit.owned_tags
  end

  def new
    @kit = Kit.new
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
