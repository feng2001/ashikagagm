class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  
  # 重複防止構文
  validates :follower, presence: true
  validates :followed, presence: true
  validates :followed_id, uniqueness: { scope: :follower_id }
  
  def followed_by? user
       followed.where(follower_id: user.id).exists?
  end
  
end