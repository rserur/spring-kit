class PostsController < ApplicationController

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

      if @post.message
        number = @post.recipient.phone

        if !number.empty?
          send_text_message(@post.recipient.phone, @post.body)
          flash[:notice] = "Post sent to #{@post.recipient.role} as text message
          and added to kit."
        else
          flash[:alert] = "Post NOT sent as message. Recipient account has no
          phone number."
          flash[:notice] = "Post added to kit."
        end
      else
        flash[:notice] = 'Post added to kit.'
      end

    else
      flash[:notice] = 'Post could not be added to kit.'
    end

    redirect_to @kit
  end

  def edit
    @post = Post.find(params[:id])
    @kit = Kit.find(params[:kit_id])

    @msg = Post.where("message = true AND recipient_id = ?", @kit.client_id).last

    @collections = @kit.owned_tags
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post edited!"
      redirect_to kit_path(@post.kit)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    kit = @post.kit_id
    @post.destroy

    flash[:alert] = 'Post deleted from kit.'
    redirect_to kit_path(kit)
  end

  def send_text_message(recipient, message)
    body = Nokogiri::HTML(message)
    body = body.xpath("//text()").to_s
    body += " - SpringKit Message from " + @post.recipient.full_name
    number_to_send_to = recipient

    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      from: "+1#{twilio_phone_number}",
      to: number_to_send_to,
      body: body
    )
  end

  private

    def post_params
      params.require(:post).permit(
        :title, :body, :collection_list, :media, :message
      )
    end
end
