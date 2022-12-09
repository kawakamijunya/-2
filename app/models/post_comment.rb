class PostComment < ApplicationRecord

  belongs_to :user #PostCommentモデルに関連付けられるUserモデルは、1つ
  belongs_to :post_image #PostCommentモデルに関連付けられるPostImageモデルは、1つ
  
end
