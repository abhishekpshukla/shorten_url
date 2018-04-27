class VisitorsController < ApplicationController
  
  def index
  	@url_shorten = UrlShorten.new
  end
end
