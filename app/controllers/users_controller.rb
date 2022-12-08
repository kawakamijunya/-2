class UsersController < ApplicationController
  def show
    @user=User.find(params[:id]) #「URLに記載されたIDを参考に、必要なUserモデルを取得する」
    @post_images=@user.post_images #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す 
    #結果的に、全体の投稿ではなく、個人が投稿したもの全てを表示できる
  end

  def edit
  end
end
