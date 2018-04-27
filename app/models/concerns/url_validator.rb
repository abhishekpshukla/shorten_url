class UrlValidator < ActiveModel::EachValidator
	
	def validate_each(record, attribute, value)
		unless value =~ /^#{URI::regexp}$/
      record.errors[attribute] << (options[:message] || "is not a valid url.")
    end
	end

end