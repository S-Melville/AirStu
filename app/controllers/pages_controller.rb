class PagesController < ApplicationController
  def home
  	@rooms = Room.limit (3)
  end

  def search #search conttoller
  	
  	if params[:search].present? && params[:search].strip != "" #checks the search field is not empty
  		session[:loc_search] = params[:search] #remembers the users previous search
  	end

  	arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance') #gets all rooms that are within 5 miles of locations search
  	else
  		@rooms_address = Room.where(active: true).all #if location search left blank gets all rooms
  	end

  	@search = @rooms_address.ransack(params[:q]) # uses ransack gem to search lists that match users search criteria. params come from "q" search.erb
  	@rooms = @search.result

  	@arrRooms = @rooms.to_a # all rooms returned are returned as an array so rooms already booked(unavailable search dates) can be removed

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?) #checks if users searched for a date 

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])

  		@rooms.each do |room| #for each room returned in search run the following code

  			not_available = room.reservations.where(
  					"(? <= start_date AND start_date <= ?) 
  					OR (? <= end_date AND end_date <= ?) 
  					OR (start_date < ? AND ? < end_date)", #room unavailibility conditions
  					start_date, end_date,
  					start_date, end_date,
  					start_date, end_date
  				).limit(1) #if at least 1 of the above conditions is met then the room is unavailable

  			if not_available.length > 0
  				@arrRooms.delete(room)	# deletes room from array (search result) if not available
  			end	

  		end

  	end

  end
end
