class UrlShortensController < ApplicationController

	def create
		@url_shorten = UrlShorten.new(url_shorten_params)
		# respond_to do |format|
		# 	if @url_shorten.save

		# 	else
		# 	end
		# end
	end

	private

	def url_shorten_params
		params.require(:url_shorten).permit(:original_url)
	end

end
