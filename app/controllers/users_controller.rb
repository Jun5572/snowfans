class UsersController < ApplicationController
	before_action :authenticate_user!

	layout 'main'

# 登録ユーザー一覧
	def index
		
	end

# ユーザー詳細
	def show
		@user = User.find(params[:id])
		@events = @user.events.where("events.date >= ?", Date.today).order(created_at: :desc)
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
			flash[:notice] = "更新しました"
			redirect_to user_path(@user.id)
		else
			flash.now[:error] = "更新に失敗しました"
			render :edit
		end

	end


	def check_lists
		@user = User.find(params[:id])
    	@interests = current_user.interests.order(created_at: :desc)
    	render :show
  	end

  	def join_lists
		@user = User.find(params[:id])
  		@joins = current_user.joins.order(created_at: :desc)
  		render :show
  	end

	private

	def user_params
		params.require(:user).permit(:nickname, :thumbnail, :description, :area_id)
	end
end
