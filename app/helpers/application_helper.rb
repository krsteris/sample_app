# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    # Return a title on a per-page basis.
  def title
    #ova ne treba da go ima
    return "Pages title Home"
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      #za da nema malicious code
      "#{base_title} | #{h(@title)}"
      #"#{base_title} | #{@title}"
    end
  end

  
end
