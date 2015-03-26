module EventsHelper
  def category_picker
    cats = get_categories.to_a
    cats = cats.map{|a, b| [a.html_safe, b]}
    select_tag :category_name, options_for_select(cats)
  end

  def weather_value path
    @weather.at_xpath(path).child
  end

  def address_from_event event
    "#{event['venue_address'] || event['address']}, #{event['city_name']} #{event['region_abbr']} #{event['postal_code']}"
  end

  def html_address_from_event event
    "#{ h (event['venue_address'] || event['address'])},#{h event['city_name']}+#{event['region_abbr']}+#{event['postal_code']}"
  end
end
