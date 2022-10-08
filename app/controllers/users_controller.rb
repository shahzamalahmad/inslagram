class UsersController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_user, only: [:edit, :update]
	before_action :require_same_user, only: [:edit, :update, :destroy]


	def show
		@articles = Article.all
		@user = User.find(params[:id])
	end
	def user_params
      params.require(:user).permit(:name, :username, :bio, :website, :email, :phone, :gender)

	end

end
