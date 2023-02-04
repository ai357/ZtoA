class Companies::MessagesController < ApplicationController

  def index
    @messages = current_company.messages
  end

end
