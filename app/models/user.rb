class User < ActiveRecord::Base
	has_secure_password
	has_many :restaurants
	validates :name,:email,:password, presence: true, uniqueness: true
end
