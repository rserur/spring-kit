class PostsController < ApplicationController

  def new
    @kit = Kit.find(params[:kit_id])
    @post = Post.new
  end

  def create
    @kit = Kit.find(params[:kit_id])

    @post = Post.new(post_params)

    # Set sender and recipient based on current user.
    if current_user.id == @kit.client_id
      @post.sender_id = current_user.id
      @post.recipient_id = @kit.practitioner_id
    else
      @post.sender_id = @kit.practitioner_id
      @post.recipient_id = current_user.id
    end

    @post.kit = @kit

    if @post.save
      redirect_to @kit, notice: 'Message sent.'
    else
      render :new, notice: 'Message could not be sent.'
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_id, :attachment_id)
  end

end
