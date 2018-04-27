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

class UrlShorten < ApplicationRecord
  belongs_to :user, required: false

  validates :original_url, :short_url, presence: true, url: true
  validates :short_url, uniqueness: true

  before_save :set_expiry_date

  private

  # Admin can set the expire days in application.rb files
  def set_expiry_date
  	expire_at = Date.today + Rails.application.config.url_expire_after
  end

end
