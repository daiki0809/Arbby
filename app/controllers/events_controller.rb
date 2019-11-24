class EventsController < ApplicationController

before_action :authenticate_user!

	def create
		if params[:event][:start] > params[:event][:end]
			@error1 = true
		else
			@challenge_id = params[:challenge]
			event = current_user.events.new(event_params)
			if event.save
			else
				@error2 = true
			end
		end
	end

	def index
		some_date = Time.now
		@events = current_user.events.where("start >= :date", date: some_date.beginning_of_day)
	end

	def update
		some_date = Time.now
		@event = Event.find(params[:id])
		if params[:event][:start] > params[:event][:end]
			@error1 = true
		else
			if @event.user != current_user
				redirect_to events_path
			end
			if @event.update(event_params)
			else
				@error2 = true
			end
		end
		@events = current_user.events.where("start >= :date", date: some_date.beginning_of_day)
	end

	def destroy
		event = Event.find(params[:id])
		if @event.user != current_user
			redirect_to events_path
		end
		event.destroy
		some_date = Time.now
		@events = current_user.events.where("start >= :date", date: some_date.beginning_of_day)
	end

	def delete_all
		some_date = Time.now
		events = current_user.events.where("start <= :date", date: some_date.beginning_of_day)
		events.delete_all
	end

	def catch
        render :json => current_user.events.to_json
	end

	private
	def event_params
		params.require(:event).permit(:title, :start, :end)
	end

end
