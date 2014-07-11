class Kit < ActiveRecord::Base
  has_many :posts,
  dependent: :destroy,
  inverse_of: :kit

  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :practitioner, class_name: 'User', foreign_key: 'practitioner_id'

  validates :client_id, presence: true
  validates :client_id, uniqueness: { scope: :practitioner_id }
  validates :practitioner_id, presence: true

  def last_updated
    if !self.posts.empty?
      return self.posts.last.created_at
    else
      return "Zero posts in kit."
    end
  end
end
