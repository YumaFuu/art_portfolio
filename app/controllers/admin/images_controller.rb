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
    if new_image.save
      flash[:info] = "新規作成しました"
      redirect_to(admin_images_path)
    else
      @image_catgories = Image::CATEGORY_ENUM.keys
      flash[:info] = "入力情報に誤りがあります"
      render(:new)
    end
  end

  def edit
    @image = Image.find(params[:id])
    @image_categories = Image::CATEGORY_ENUM.keys
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(update_params)
      flash[:info] = "更新しました"
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

  def update_params
    params.require(:image).permit(:name_jp, :name_en, :category)
  end

  def create_params
    params.require(:new_image).permit(:image_data, :name_jp, :name_en, :category)
  end

  def create_params_hash
    image_path = create_params[:image_data].tempfile.path
    image_url = Gyazo.upload(image_path)

    {
      image_url: image_url,
      name_jp: create_params[:name_jp],
      name_en: create_params[:name_en],
      category: create_params[:category],
    }
  end
end
