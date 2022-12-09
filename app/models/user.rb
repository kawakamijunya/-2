class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #dependent: :destroyは、has_manyで使えるオプションです。 1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  has_many :post_images,dependent: :destroy #PostImageモデルとの1:Nの関係
  has_many :post_comments,dependent: :destroy #PostCommentモデルとの1:Nの関係
  has_one_attached :profile_image


  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path=Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path),filename: 'default-i,image.jpg',content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit:[width,height]).processed
  end

end
