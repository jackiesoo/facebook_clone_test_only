class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true
	validates :email, uniqueness: true, presence: true
	has_many :likes, dependent: :destroy
	has_many :statuses, dependent: :destroy
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates :password, length: { in: 6..20 }
	validates :password_confirmation, presence: true 
end
