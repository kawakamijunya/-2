Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

#コメントは、投稿画像に対してコメントされます。このため、post_commentsは、post_imagesに結びつきます。
#以下のように親子関係になります。
 resources :post_images,only:[:new,:create,:index,:show,:destroy] do
     resources :post_comments,only:[:create,:destroy]
 end
 resources :users,only:[:show,:edit,:update]

  get 'homes/about',as:'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
