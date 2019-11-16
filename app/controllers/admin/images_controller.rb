class Admin::ImagesController < AdminController
  layout "admin"
  def index
    @images = Image.all
  end

  def new
    @image_categories = Image::CATEGORY_ENUM.keys
    @image_count_arr = [*1..Image.all.count]
  end

  def create
    image = Image.new(create_params_hash)
    image.order = Image.pluck(:order).compact.max + 1 rescue 100
    if image.save
      update_order(image)
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
    @image_count_arr = [*1..Image.all.count]
    @image_categories = Image::CATEGORY_ENUM.keys
  end

  def update
    @image = Image.find(params[:id])
    @image.order = Image.pluck(:order).compact.max + 1 rescue 100
    if @image.update_attributes(update_params_hash)
      update_order(@image)
      flash[:info] = "更新しました"
      redirect_to(admin_images_path)
    else
      flash[:info] = "入力情報に誤りがあります"
      binding.pry
      render(:new)
    end
  end

  def destroy
    Image.find(params[:id]).destroy
    flash[:info] = "消しました"
    redirect_to(admin_images_path)
  end

  private

  def update_order(image)
    order = params[:image][:order].to_i
    Image.where(order: 0...order).each do |image|
      image.update(order: image.order + 1)
    end
    image.update(order: order)
  end

  def update_params
    params.require(:image).permit(:name_jp, :name_en, :category)
  end

  def update_params_hash
    {
      name_jp: update_params[:name_jp],
      name_en: update_params[:name_en],
      category: update_params[:category],
    }
  end


  def create_params
    params.require(:image).permit(:image_data, :name_jp, :name_en, :category)
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
