require File.expand_path("../../../../spec/rails_helper", __FILE__)

describe "Creating a post" do
	let(:user) { create(:user) }

	def create_a_post(options={})
		options[:title] ||= "My post"
		options[:body] ||= "This the body of the post."

		visit "/posts"
		click_link "New Post"
		expect(page).to have_content("New Post")

		fill_in "Title", with: options[:title]
		fill_in "Body", with: options[:body]
		click_button "Create a post"
	end

	before do
		sign_in(user, password: "treehouse1")
	end

	it "redirects to the post list index page on success" do
		create_a_post
		expect(page).to have_content("My post")
	end
end
