class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @user = current_user
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      flash[:notice] = "Your maths were sent!"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def show
    @messages = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
