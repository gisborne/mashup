class EventsController < ApplicationController
  def search
  end

  def index
    search_hash = {'q' => params['search']}
    search_hash['l'] = params['location'] if params['location'].present?
    search_hash['category'] = params['category'] if params['category'].present?
    @events = get_events search_hash
  end

  def show
    @event = get_event_by_id params[:id]

    lat = @event['latitude']
    lon = @event['longitude']

    @weather = get_weather_for_point_and_date lat, lon, Date.strptime(@event['start_time'], '%Y-%m-%d %H:%M:%S')
    @weather.remove_namespaces!

    @wikipedia = get_wikipedia_near_point lat, lon
    @wikipedia.remove_namespaces!

    @venues = find_near lat, lon, 'drinks'
  end
end
