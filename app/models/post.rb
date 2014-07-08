class Post < ActiveRecord::Base
  belongs_to :kits

  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
end
