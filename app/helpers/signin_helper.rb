module SigninHelper
	@@signin= Hash.new {}
	def log_in(user)
		@@signin[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: @@signin[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end
end
