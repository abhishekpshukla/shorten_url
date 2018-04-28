class UrlShortensController < ApplicationController
	before_action :find_url_shorten, only: [:create]

	def redirect_url
		url_shorten = UrlShorten.where(short_url: params[:short_url]).first
		url_shorten.click_increment!
		redirect_to url_shorten.original_url 
	end

	def create
		respond_to do |format|
			if find_url_shorten.present?
				format.js { 
					render action: 'create', 
					locals: get_json(find_url_shorten)
					}
			else
				@url_shorten = UrlShorten.new(url_shorten_params)
				if @url_shorten.save
					format.js {
						render action: 'create',
						locals: get_json(@url_shorten)
					}
				else
					format.js { render json: @url_shorten.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	private

	def get_json(obj)
		render_obj = { 
			short_url: redirect_url_url(obj.short_url),
			original_url: obj.original_url 
		}
		return render_obj
	end

	def find_url_shorten
		UrlShorten.where(original_url: params[:url_shorten][:original_url]).first
	end

	def url_shorten_params
		params.require(:url_shorten).permit(:original_url)
	end

end
