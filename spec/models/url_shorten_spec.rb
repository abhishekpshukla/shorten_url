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

require 'rails_helper'

RSpec.describe UrlShorten, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#original_url" do
  	subject { build(:url_shorten) }
  	
  	it "should validate presence" do
  		expect(subject).to be_valid
  	end

  	it "should not be valid if the original_url is not present" do
  		subject.original_url =  nil
  		expect(subject).to_not be_valid
  	end

  	it "should not be valid if the original_url format is not the valid URL" do
  		subject.original_url =  "THIS_IS_NOT_A_VALID_URL"
  		expect(subject).to_not be_valid
  	end

  end


  describe "#short_url" do
  	subject { build(:url_shorten) }
  	
  	it "Should validate presence" do
  		expect(subject).to be_valid
  	end

  	it 'should not save duplicate URL' do
  		short_url_one = create(:url_shorten)
  		short_url_two = build(:url_shorten, short_url: short_url_one.short_url)
  		expect(short_url_two).to_not be_valid	
  	end
  end

end
