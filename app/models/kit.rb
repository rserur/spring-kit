class Kit < ActiveRecord::Base
  has_many :posts

  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :practitioner, class_name: 'User', foreign_key: 'practitioner_id'
end
