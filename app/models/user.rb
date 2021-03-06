class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :name
          validates :staff_num, numericality: {with: /\A[0-9]+\z/, message: 'Half-width number' }
          validates :occupation
         end
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  
   has_many :room_users
   has_many :rooms, through: :room_users
   has_many :messages
end
