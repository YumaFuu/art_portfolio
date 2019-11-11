module SessionsHelper
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def authenticate_admin
    unless logged_in?
      flash[:info] = "ログインしてください"
      redirect_to(admin_root_path)
    end
  end

  def logged_in?
    !current_admin.nil?
  end

  def log_out
    session[:admin_id] = nil
  end
end
