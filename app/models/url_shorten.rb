# == Schema Information
#
# Table name: url_shortens
#
#  id           :bigint(8)        not null, primary key
#  user_id      :bigint(8)
#  original_url :text(65535)
#  short_url    :string(255)
#  clicks       :integer          default(0)
#  expire_at    :datetime
#  is_disable   :boolean          default(FALSE)
#  ip_address   :string(255)
#  geo_location :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'convert_url'
class UrlShorten < ApplicationRecord
	# include ConvertUrl
  belongs_to :user, required: false

  validates :original_url, presence: true, url: true
  validates :short_url, uniqueness: true

  before_save :set_expiry_date
  before_save :shorten_original_url

  private

  def shorten_original_url
  	new_short_url = ConvertUrl.new(self.original_url)
  	
  	# just to make sure that short_url is not present
  	begin
  		short_url = new_short_url.convert
  		if UrlShorten.where(short_url: short_url).first.nil?
  			self.short_url = short_url 	
  		end
  	end until self.short_url.present?
  end

  def set_expiry_date
  	# Admin can set the expire days in application.rb files
  	expire_at = Date.today + Rails.application.config.url_expire_after
  end

end
