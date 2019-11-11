class Admin::SessionsController < AdminController
  skip_before_action :authenticate_admin, only: [:new, :create]

  def new
    if logged_in?
      flash[:info] = "ログインしています"
      redirect_to(admin_images_path)
    end
  end

  def create
    admin = Admin.find_by(email: params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      flash[:info] = "ログインしました"
      redirect_to(admin_images_path)
    else
      flash[:info] = "入力情報が間違ってます"
      render :new
    end
  end

  def destroy
    log_out
  end
end
