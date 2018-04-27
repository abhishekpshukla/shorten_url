class UrlShortensController < ApplicationController

	def create
		@url_shorten = UrlShorten.new(url_shorten_params)
		p @url_shorten.valid?
	end

	private

	def url_shorten_params
		params.require(:url_shorten).permit(:original_url)
	end

end
