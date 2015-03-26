Simple demonstration of accessing four different geographical APIs. Go to /events/search, search for some events, then click the little blue i icon at the end of an event to see the weather, nearby wikipedia articles, and highly-rated foursquare drinking establishments nearby.

Config (probably in a config/initializers file) needs to do these:

require 'eventful_api'
EventfulApi.configure do |config|
  config.app_key = <whatever>
  config.consumer_key = <whatever>
  config.consumer_secret = <whatever>
end

FoursquareClientID = <whatever>
FoursquareClientSecret = <whatever>

WikipediaUserName = <whatever>
