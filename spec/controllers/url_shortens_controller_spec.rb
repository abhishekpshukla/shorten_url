require 'rails_helper'

RSpec.describe UrlShortensController, type: :controller do

	describe "POST create" do
		
		context "With valid data" do
			it "Create a new url shorten record" do
				headers = { "CONTENT_TYPE" => "application/json" }
				post :create, params: { url_shorten: { original_url: "http://www.abhishekpshukla.com/" } }, format: :js
				expect(response).to be_success
			end

			context "With invalid valid data" do
				it "Create a new url shorten record" do
					headers = { "CONTENT_TYPE" => "application/json" }
					post :create, params: { url_shorten: { original_url: "THIS_IS_NOT_VALID_URL" } }, format: :js
					expect(response).to_not be_success
				end
			end

			context "show existing record if the entered url is present" do
				it "should show exisitng record" do
					url_shorten = create(:url_shorten)
					post :create, params: { url_shorten: { original_url: "http://www.abhishekpshukla.com/" } }, format: :js
					expect(response).to be_success
				end
			end

		end

	end

	describe "GET redirect_url" do

		it "should redirect to original page" do
			url_shorten = create(:url_shorten)
			# get ""
		end
	end
end
