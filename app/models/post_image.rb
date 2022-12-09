class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user #PostImageモデルに関連付けられるUserモデルは、1つ
  has_many :post_comments,dependent: :destroy #PostCommentモデルとの1:Nの関係
  has_many :favorites,dependent: :destroy
  
  validates :shop_name,presence: true #shop_nameが存在しているかを確認するバリデーション
  validates :image,presence: true #imageが存在しているかを確認するバリデーション


  def get_image
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    image
  end


  def favorited_by?(user) #このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます
    favorites.exists?(user_id: user.id) #存在していればtrue、存在していなければfalseを返すようにしています。
  end

end
