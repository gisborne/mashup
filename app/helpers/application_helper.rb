module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Mashup"
    end
  end
end
