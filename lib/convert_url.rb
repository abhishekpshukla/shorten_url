class ConvertUrl

	def initialize(original_url)
		@original_url = original_url
	end

	# used based 36 to convert the random string
	# Admin can change the length of the string from application.rb files
	# this is a simple logic to generate a unique string. 
	# but we can generate different variations as well for generating a Unique string.
	def convert
		return rand(36**Rails.application.config.shorten_url_length).to_s(36)
	end


end