class ApplicationController < ActionController::Base
  
  def require_company_logged_in?
    redirect_to root_path if !current_company
  end
  
  # ログアウトしてたらトップページに遷移する
  def require_employees_logged_in?
    redirect_to root_path if !current_employees
  end
  
end
