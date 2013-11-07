module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Reservester"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def full_address(restaurant)
    address = "#{restaurant.street},#{restaurant.city},#{restaurant.state},#{restaurant.zip}"
    address = address.gsub(' ', '+')
    address
  end

end
