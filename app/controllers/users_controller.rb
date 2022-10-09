class UsersController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_user, only: [:edit, :update]
	before_action :require_same_user, only: [:edit, :update, :destroy]


	def show
		@articles = Article.all
		@user = User.find(params[:id])
	end

	def follow
	  @user = User.find(params[:id])
	  current_user.followees << @user
	  redirect_back(fallback_location: user_path(@user))
	end

	def unfollow
	  @user = User.find(params[:id])
	  current_user.followed_users.find_by(followee_id: @user.id).destroy
	  redirect_back(fallback_location: user_path(@user))
	end
	
	def user_params
      params.require(:user).permit(:name, :username, :bio, :website, :email, :phone, :gender)

	end

end
