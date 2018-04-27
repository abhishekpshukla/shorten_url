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

FactoryBot.define do
  factory :url_shorten do
    user nil
    original_url "http://www.abhishekpshukla.com/"
    short_url "http://localhost:3000/short_url"
    clicks 1
    expire_at "2018-04-27 16:44:22"
    is_disable false
    ip_address "MyString"
    geo_location "MyString"
  end
end
