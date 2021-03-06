class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new
  #   if @message.save
  #     redirect_to :index
  #   else
  #     render :createend
  # end
end
