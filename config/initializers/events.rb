require 'eventful_api'
require 'json'

def get_eventful_client
  @client ||= EventfulApi::Client.new oauth_token: 'token', oauth_secret: 'token secret'
end

def get_categories
  @categories ||= get_categories2
end

def get_events q
  res = get_eventful_client.get '/events/search', q
  res['events']['event'] if res['events']
end

def get_event_by_id id
  res = get_eventful_client.get '/events/get', id: id
end

private

def get_categories2
  cs = get_eventful_client.get '/categories/list', {}
  res = {}

  cs['category'].each do |h|
    res[h['name']] = h['id']
  end
  res
end
