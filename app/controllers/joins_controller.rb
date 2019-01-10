class JoinsController < ApplicationController
	# 参加するボタンを押した時
	def create
		event = Event.find(params[:event_id])
		join = Join.new
		join.user_id = current_user.id
		join.event_id = event.id
		if join.save
			flash[:notice] = "イベント参加が確定しました"
			redirect_back(fallback_location: request.referer)
		else
			puts "失敗"
		end
	end

# 参加辞退
	def destroy
		event = Event.find(params[:event_id])
		join = Join.find_by(event_id: event.id)
		if join.destroy
			redirect_back(fallback_location: request.referer)
		else
			puts "失敗"
		end
	end
end
