class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:name,
												:email,
												:password,
												:image))
		if @user.save
			redirect_to user_url
		else
			render 'new'
		end
	end

	
end
