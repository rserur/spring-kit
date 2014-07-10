class Post < ActiveRecord::Base
  belongs_to :kit, inverse_of: :posts
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  has_attached_file :media, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :media, content_type: /\Aimage\/.*\Z/

  validates :recipient_id, presence: true
  validates :sender_id, presence: true
  validates :body, presence: true
  validates :kit_id, presence: true
end
