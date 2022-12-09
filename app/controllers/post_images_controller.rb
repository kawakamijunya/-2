class PostImagesController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @post_image=PostImage.new
  end

  #投稿データの保存
  def create
    @post_image=PostImage.new(post_image_params)
    @post_image.user_id=current_user.id
    if @post_image.save
     redirect_to post_images_path #indexページへリダイレクト
    else
     render :new
    end
  end


  def index
    @post_images=PostImage.all
  end

  def show
    @post_image=PostImage.find(params[:id])
    @post_comment=PostComment.new #コメントを投稿するためのインスタンス変数を定義
  end

  def destroy
    @post_image=PostImage.find(params[:id]) #削除するPostImageレコードを取得
    @post_image.destroy
    redirect_to '/post_images' #投稿一覧ページへのリダイレクト
  end

  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name,:image,:caption)
  end

end


