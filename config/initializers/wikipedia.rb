require 'net/http'
require 'nokogiri'

def get_wikipedia_near_point lat, lon
  #http://api.geonames.org/findNearbyWikipedia?lat=47&lng=9&username=demo
  uri = URI('http://api.geonames.org/findNearbyWikipedia')
  params = {
    lat: lat,
    lng: lon,
    radius: 5,
    maxRows: 10,
    username: WikipediaUserName}
  uri.query = URI.encode_www_form params
  res = Net::HTTP.get_response(uri)
  Nokogiri::XML res.body
end
