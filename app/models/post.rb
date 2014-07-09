class Post < ActiveRecord::Base
  belongs_to :kit, inverse_of: :posts
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  has_one :attachment, dependent: :destroy,
  inverse_of: :post

  validates :recipient_id, presence: true
  validates :sender_id, presence: true
  validates :body, presence: true
  validates :kit_id, presence: true
end
