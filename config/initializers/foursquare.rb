require 'net/http'
#j['response']['groups'][0]['items'].map{|x| {name: x['venue']['name'], tips: x['tips'].map{|t| t['text']}, url: x['venue']['url'], location: x['venue']['location'] }}
def find_near lat, lon, section
  uri = URI('https://api.foursquare.com/v2/venues/explore')
  params = {
      ll: "#{lat},#{lon}",
      client_id: FoursquareClientID,
      client_secret: FoursquareClientSecret,
      v: '20140806',
      section: section}
  uri.query = URI.encode_www_form params
  res = Net::HTTP.get_response(uri)
  j = JSON.parse res.body
  j['response']['groups'][0]['items'].map{|x| {name: x['venue']['name'], tips: x['tips'].map{|t| t['text']}, url: x['venue']['url'], location: x['venue']['location']['formattedAddress'] }}
end
#https://api.foursquare.com/v2/venues/explore?ll=32.843235,-117.016848&client_id=E4SN5XJSTML0C3ANVP5UYMSPHSSMMRTGHI2HIOCVCJF0FZDH&
#   client_secret=UW2C0PYQ2K4UXWQFBXQ32KQHAH3KXCPLOZS0YLABAVJX1Z2C&v=20140806
