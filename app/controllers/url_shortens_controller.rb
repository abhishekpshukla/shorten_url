class UrlShortensController < ApplicationController
	before_action :find_url_shorten

	def create
		respond_to do |format|
			if find_url_shorten.present?
				format.js { 
					render action: 'create', 
					locals: { 
						short_url: "http://#{request.host}/#{find_url_shorten.short_url}",
						original_url: find_url_shorten.original_url 
						}
					}
			else
				@url_shorten = UrlShorten.new(url_shorten_params)
				if @url_shorten.save
					format.js {
						render action: 'create',
						locals: {
							short_url: "http://#{request.host}/#{@url_shorten.short_url}",
							original_url: @url_shorten.original_url		
						}
					}
				else
					format.js { render json: @url_shorten.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	private

	def find_url_shorten
		UrlShorten.where(original_url: params[:url_shorten][:original_url]).first
	end

	def url_shorten_params
		params.require(:url_shorten).permit(:original_url)
	end

end
