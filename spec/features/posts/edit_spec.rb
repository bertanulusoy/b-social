require File.expand_path("../../../../spec/rails_helper", __FILE__)

describe "Editing a post" do
	let(:user) { create(:user) }
	let!(:post) { Post.create(title:"Groceries", body: "Groceries list.") }

	def update_a_post(options={})
		options[:title] ||= "My post"
		options[:body] ||= "This the body of the post."
		post = options[:post]

		visit "/posts"
		#puts page.body ************debug statement
		within "#post_#{post.id}" do
			click_link "Edit"
		end
	
		fill_in "Title", with: options[:title]
		fill_in "Body", with: options[:body]
		click_button "Save"
	end

	before do
		sign_in(user, password: "treehouse1")
	end

	
	it "updates a post successfully with correct information" do
		update_a_post post: post,
									title: "New title",
									body: "New description"

		post.reload

		expect(page).to have_content("Post was successfully updated.")
		expect(post.title).to eq("New title")
		expect(post.body).to eq("New description")

	end


end
