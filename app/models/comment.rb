class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :user

  validates :post_id, :user_id, :body, presence: true
end
