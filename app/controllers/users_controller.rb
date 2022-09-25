class UsersController < ApplicationController

	def user_params
      params.require(:user).permit(:name, :username, :bio, :website, :email, :phone, :gender)

	end

end
