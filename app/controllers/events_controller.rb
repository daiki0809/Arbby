class EventsController < ApplicationController

	def create
		event = current_user.events.new(event_params)
		event.save
	end

	def destroy
	end

	private
	def event_params
		params.require(:event).permit(:title, :start, :end)
	end

end
