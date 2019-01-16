class EventsController < ApplicationController

	layout 'main'

	after_action :create_notifications, only: [:create]


# 投稿一覧（HOME）
	def index
		# @events = Event.all.order(created_at: :desc)
		@events = Event.where("events.date >= ?", Date.today).order(created_at: :desc)
	end

	# 絞り込み検索
	def narrow_down
		@events = Event.where("events.date >= ?", Date.today).where(area_id: current_user.area_id).order(created_at: :desc)
		render :index
	end

# チェックリスト一覧
	def check_lists
		@interests = Interest.where(user_id: current_user.id).order(created_at: :desc)
		render :index
	end

# 新規投稿
	def new
		@event = Event.new
		@placeholder_text = "ボーダーです！今度の休みを使って群馬県の丸沼高原に滑りに行こうと思います！カービング練習中です！もしよかったら一緒に行きませんか？twitterからもお気軽にDMくださーい！"
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		if @event.save
			flash[:notice] = "予定を投稿しました"
			redirect_to user_path(current_user.id)
		else
			flash.now[:error] = "投稿に失敗しました"
			render :new
		end
	end

# 投稿詳細
	def show
		@event = Event.find(params[:id])
		@user = User.find(params[:user_id])
	 	# @introduction = @user.description
		# @introduction = "自己紹介文はありません" if @introduction.blank?
		@comment = Comment.new
		@comments = Comment.where(event_id: @event.id)
		@interests = Interest.where(event_id: @event.id)
	end

# 投稿編集
	def edit
	end

	def update
		
	end

# 投稿削除
	def destroy
		
	end



	private

		def create_notifications
			@users = User.where(area_id: @event.area_id).where.not(id: current_user.id)

			@users.each do |user|
				Notification.create(  	user_id: user.id,
										event_id: @event.id,
										notified_by_id: current_user.id,
										notification_type: "#{user.area.name}"
				)
			end
		end

		def event_params
			params.require(:event).permit(:title, :description, :date, :area_id)
		end
end
