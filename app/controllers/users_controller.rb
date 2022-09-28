class UsersController < ApplicationController
	def show
	end
	def user_params
      params.require(:user).permit(:name, :username, :bio, :website, :email, :phone, :gender)

	end

end
