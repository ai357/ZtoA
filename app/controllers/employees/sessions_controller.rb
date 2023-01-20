# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  before_action :employee_state, only: [:create]

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


  def after_sign_in_path_for(resource)
    employees_employee_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  
  protected

  def employee_state

    @employee = Employee.find_by(email: params[:employee][:email])
    # @employeeが取得できた場合次へ進む
    # @employeeが取得できなかった場合returnの結果トップページに戻る
    return if !@employee
    # 特定のアカウントのパスワードと入力されたパスワードが一致しているかを確認する
    if @employee.valid_password?(params[:employee][:password])
      if @employee.is_deleted == true
          redirect_to root_path
      else @employee.is_deleted == false
      end
    end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
