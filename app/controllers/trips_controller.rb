class TripsController < ApplicationController
  #passing the trip marker information to view
  def index
    @trips = Trip.all
    #@json = @trips.to_gmaps4rails
    @json = @trips.to_gmaps4rails do |trip, marker|
        marker.infowindow render_to_string(:partial => "/trips/infowindow", :locals => { trip: trip})
        marker.title "#{ trip.app ? "App trip": "Web trip" }"
        if trip.status == "complete"
          marker.picture({:picture => "assets/male-2-green.png",
                          :width => 25,
                          :height => 35})
        elsif trip.status == "cancelled" 
          marker.picture({:picture => "assets/male-2-red.png",
                          :width => 25,
                          :height => 35})
        else
          marker.picture({:picture => "assets/male-2-yellow.png",
                          :width => 25,
                          :height => 35})
        end
    end
  end
end
