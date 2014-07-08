class Post < ActiveRecord::Base
  belongs_to :kits

  has_one :client_id, through: :kits
  has_one :practitioner_id, through: :kits
end
