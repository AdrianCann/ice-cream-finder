


#https://maps.googleapis.com/maps/api/place/nearbysearch/output?parameters


require 'rest-client'
require 'json'
require 'addressable/uri'
require_relative 'secret.rb'



# GET /search?q=cat+hats HTTP/1.1
# Host: bing.com
# Content-type:application/json
#https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&sensor=false&key=AddYourOwnKeyHere

#http://maps.googleapis.com/maps/api/geocode/output?parameters
#https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=true_or_false&key=API_KEY



def my_location(address)
  Addressable::URI.new(
  :scheme => "https",
  :host => "maps.googleapis.com",
  :path => "/maps/api/geocode/json",
  :query_values => {
    :address => address,
    :sensor => false,
    :key => GOOGLE_KEY
  }
  ).to_s
end

#https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&sensor=false&key=AddYourOwnKeyHere


def my_ice_cream_search(arr)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/place/nearbysearch/json",
    :query_values => {
      :location => arr,
      :radius => "test",
      :rankby => :distance,
      :types => "food",
      :keyword => "ice+cream",
      :sensor => false,
      :key => GOOGLE_KEY
    }
  ).to_s

end

def get_position(address = "770 Broadway New York NY")
  make_url = my_location(address)

  response = RestClient.get(make_url)

  location = JSON.parse(response)

  x = location["results"][0]["geometry"]["location"]["lat"]
  y = location["results"][0]["geometry"]["location"]["lng"]

  [x,y]
end




