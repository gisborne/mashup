require 'net/http'
require 'nokogiri'

def get_weather_for_point_and_date lat, lon, date
  #http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdXMLclient.php?gmlListLatLon=38.99,-77.02+39.70,-104.80+47.6,-122.30&featureType=Forecast_Gml2Point&begin=2000-01-01T00:00:00&end=2018-01-01T00:00:00&compType=Between&propertyName=maxt,wx
  uri = URI('http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdXMLclient.php')
  d = date.to_formatted_s(:iso8601)
  params = {
      gmlListLatLon: "#{lat},#{lon}",
      featureType: 'Forecast_GmlObs',
      begin: d,
      end: d}
  uri.query = URI.encode_www_form params
  res = Net::HTTP.get_response(uri)
  Nokogiri::XML res.body

end