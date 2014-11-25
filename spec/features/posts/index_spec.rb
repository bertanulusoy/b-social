require File.expand_path("../../../../spec/rails_helper", __FILE__)

describe "Listing post lists" do
	it "requires login" do
		visit "/posts"
		expect(page).to have_content("You must be logged in")

	end
end

