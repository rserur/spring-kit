class Post < ActiveRecord::Base
  belongs_to :kit, inverse_of: :posts
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  has_many :media
  acts_as_taggable_on :collections

  before_save :set_tag_owner

  has_attached_file :media, styles: { medium: "350x350",
    doc: ["350x350", :png] }
  validates_attachment_content_type :media, content_type: ["image/gif", "image/jpg", "image/jpeg", "image/png", "application/pdf",
    "application/msword", "text/plain"]

  validates :recipient_id, presence: true
  validates :sender_id, presence: true
  validates :body, presence: true
  validates :kit_id, presence: true

  def set_tag_owner
    set_owner_tag_list_on(kit, :collections, self.collection_list)

    collection_list
  end

  def self.search(search, kit)
    return all unless search.present?

    where("title ILIKE :search OR body ILIKE :search", search: "%#{search}%")
  end
end
