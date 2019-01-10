class EventsController < ApplicationController

	layout 'main'

# 投稿一覧（HOME）
  def index
    # @events = Event.all.order(created_at: :desc)
    @events = Event.where("date >= ?", Date.today).order(created_at: :desc)
  end

  # 絞り込み検索
  def narrow_down
    @events = Event.where(area_id: current_user.area_id).order(created_at: :desc)
    render :index
  end

# チェックリスト一覧
  def check_lists
    @interests = Interest.where(user_id: current_user.id)
    render :index
  end

# 新規投稿
  def new
    @event = Event.new
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
   #  @introduction = @user.description
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

  def event_params
    params.require(:event).permit(:title, :description, :date, :area_id)
  end
end
