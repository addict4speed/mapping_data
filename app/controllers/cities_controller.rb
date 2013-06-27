class CitiesController < ApplicationController

  #passing the city marker information to view
  def index
    @cities = City.all
    @json = @cities.to_gmaps4rails do |city, marker|
        marker.infowindow render_to_string(:partial => "/cities/infowindow", :locals => { city: city})
        marker.title "#{city.name}"
        marker.json({ :population => city.population})
        marker.picture({:picture => "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-2228a8/shapecolor-no/shadow-0/border-no/symbolstyle-color/symbolshadowstyle-white/gradient-no/male-2.png",
                        :width => 25,
                        :height => 35})
    end
  end
end
