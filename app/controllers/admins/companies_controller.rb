class Admins::CompaniesController < ApplicationController



  def index
     # 会社一覧
     @companies = Company.all
  end

  def show
    # 会社詳細
    @company = Company.find(params[:id])
  end

  def edit
    # 会社編集
    @company = Company.find(params[:id])
  end

  def update
    # 会社編集
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to admins_company_path(@company)
  end

  def destroy
    # 会社削除
  end

  def messages
    # 送信済みメッセージ一覧
    @message = Message.new
    @messages = Message.all
  end

  def send_message
    # メッセージの送信
    if params[:message][:company_id] == ""
      companies = Company.all
      companies.each do |company|
        @message = Message.new(message_params)
        @message.company_id = company.id
        @message.save
      end
      
    else
      @message = Message.new(message_params)
      @message.save
    end
    redirect_to admins_message_path
  end
  
  def unsubscribe
     @company = Company.find_by(company: params[:company])
  end

  def withdraw
    @company = Company.find_by(params[:id])
    @company.update(is_deleted: true)
    reset_session
    redirect_to admins_companies_path
  end


  private

  def company_params
    params.require(:company).permit(:name, :email)
  end

  def message_params
    params.require(:message).permit(:company_id, :message)
  end

end

