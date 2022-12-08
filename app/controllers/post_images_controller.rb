class PostImagesController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @post_image=PostImage.new
  end

  #投稿データの保存
  def create
    @post_image=PostImage.new(post_image_params)
    @post_image.user_id=current_user.id
    @post_image.save
    redirect_to post_images_path #indexページへリダイレクト
  end


  def index
  end

  def show
  end

  def destroy
  end

  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name,:image,:caption)
  end

end


