class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user?, only: [:edit, :update]

	layout 'main'

# 登録ユーザー一覧
	def index
		
	end

# ユーザー詳細
	def show
		if User.exists?(id: params[:id])
			@user = User.find(params[:id])
			@events = @user.events.where("events.date >= ?", Date.today).order(created_at: :desc)
		else
			flash[:error] = "そのユーザーは存在しません"
			redirect_back(fallback_location: root_path)
		end
	end
# 登録情報編集
	def edit
		@user = User.find(params[:id])
		@events = @user.events.where("events.date >= ?", Date.today).order(created_at: :desc)
	end

	def update
		@user = User.find(params[:id])
		@events = @user.events.order(created_at: :desc)
		if @user.update(user_params)
			flash[:notice] = "登録情報を更新しました"
			redirect_to user_path(@user.id)
		else
			flash.now[:error] = "登録情報の更新に失敗しました"
			render :edit
		end

	end

# クリップボード登録した投稿
	def check_lists
		@user = User.find(params[:id]) #current_user
    	@interests = @user.interests.order(created_at: :desc)
    	render :show
  	end

# 参加予定の予定
  	def join_lists
		@user = User.find(params[:id]) #current_user
  		@joins = @user.joins.order(created_at: :desc)
  		render :show
  	end

	private

	def user_params
		params.require(:user).permit(:nickname, :thumbnail, :description, :area_id)
	end
end
