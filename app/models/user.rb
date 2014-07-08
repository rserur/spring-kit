class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization

  has_many :kits, inverse_of: 'practitioner'
  has_one :kit, inverse_of: 'client'

  def practitioner?
    role == 'practitioner'
  end
end
