class User < ActiveRecord::Base
	validates :name, presence: true
	validates :token, presence: true, uniqueness: true
end
