json.array!(@events) do |event|
	json.extract! event, :id, :event_title
	json.start event.start_date
	json.end event.end_date
end