class SigninController < ApplicationController
	def new
		if User.exists?(token: cookies[:token])
			@user = User.find_by(token: cookies[:token])
			redirect_to '/report'
		end
	end

	def create	
	end


end
