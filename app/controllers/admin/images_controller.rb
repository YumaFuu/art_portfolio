class Admin::ImagesController < AdminController
  layout "admin"
  def index
    @images = Image.all
  end

  def new
    @image_categories = Image::CATEGORY_ENUM.keys
  end

  def create
    new_image = Image.new(create_params_hash)
    binding.pry
    if new_image.save
      flash[:info] = "新規作成しました"
      redirect_to(admin_images_path)
    else
      @image_categories = Image::CATEGORY_ENUM.keys
      flash[:info] = "入力情報に誤りがあります"
      render(:new)
    end
  end

  def edit
    @image = Image.find(params[:id])
    @image_categories = Image::CATEGORY_ENUM.keys
  end

  def update
    if new_image.save
      flash[:info] = "新規作成しました"
      redirect_to(admin_images_path)
    else
      flash[:info] = "入力情報に誤りがあります"
      render(:new)
    end
  end

  def destroy
    Image.find(params[:id]).destroy
    flash[:info] = "消しました"
    redirect_to(admin_images_path)
  end

  private

  def create_params
    params.require(:new_image).permit(:image_data, :name_jp, :name_en, :category)
  end

  def create_params_hash
    {
      image_data:  create_params[:image_data].tempfile.read,
      name_jp: create_params[:name_jp],
      name_en: create_params[:name_en],
      category: create_params[:category],
    }
  end
end
