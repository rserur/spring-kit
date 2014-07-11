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
      @post.sender_id = current_user.id
      @post.recipient_id = @kit.client_id
    end

    @post.kit_id = @kit.id

    if @post.save
      redirect_to @kit, notice: 'Post added to kit.'
    else
      render :new, notice: 'Post could not be added to kit.'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    kit = @post.kit_id
    @post.destroy

    redirect_to kit_path(kit)
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_id, :media)
  end

end
