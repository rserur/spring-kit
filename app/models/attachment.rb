class Attachment < ActiveRecord::Base
  belongs_to :post, inverse_of: :attachment

  validates :type, presence: true
  validates :name, presence: true
  validates :url, presence: true
  validates :post_id, presence: true
  validates :post_id, uniqueness:true
end
