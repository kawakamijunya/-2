class UsersController < ApplicationController
  def show
    @user=User.find(params[:id]) #「URLに記載されたIDを参考に、必要なUserモデルを取得する」
    @post_images=@user.post_images.page(params[:page]) #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す
    #結果的に、全体の投稿ではなく、個人が投稿したもの全てを表示できる
  end

  def edit
    @user=User.find(params[:id]) #URLを参考に特定のidを持ったレコードを取得する
  end

  def update
    @user=User #ユーザーの取得
    @user.update(user_params) #ユーザーのアップデート
    redirect_to user_path #ユーザーの詳細ページへのリダイレクト
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image)
  end
end
