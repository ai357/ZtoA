# frozen_string_literal: true

class Companies::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  def after_sign_in_path_for(resource)
    companies_employees_path
  end


  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  # 退会しているかを判断するメソッド
  def company_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @company = Companies.find_by(email: params[:companies][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@company
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @company.valid_password?(params[:companies][:password])
      ## 【処理内容3】
      if @customer.is_deleted == true
        redirect_to root_path
      else @customer.is_deleted == false
      end
    end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
