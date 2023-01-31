class Companies::MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

end
