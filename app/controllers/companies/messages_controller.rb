class Companies::MessagesController < ApplicationController

  def index
    @messages = current_company.messages.order(:created_at).page(params[:page]).per(10)
  end




end
