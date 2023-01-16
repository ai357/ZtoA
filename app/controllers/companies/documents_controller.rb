class Companies::DocumentsController < ApplicationController
  
  def index
    @document = Document.all
  end
  
  def updated
    
  end  
end
