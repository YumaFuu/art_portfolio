class Admin::AdminsController < AdminController
  skip_before_action :authenticate_admin, only: [:new, :create]

  def new
  end

  def create
    new_admin = Admin.new(create_params)
    if new_admin.save
      flash[:info] = "新規作成しました"
      redirect_to(admin_images_path)
    else
      flash[:info] = "入力情報に誤りがあります"
      render(:new)
    end
  end

  private

  def create_params
    params.require(:admin_params).permit(:name, :email, :password, :password_confirmation)
  end
end
