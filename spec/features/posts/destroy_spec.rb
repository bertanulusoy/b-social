require File.expand_path("../../../../spec/rails_helper", __FILE__)

describe "Creating a post" do
	let(:user) { create(:user) }
	let!(:post) { create(:post) } # no need to that => Post.create(title:"Groceries", body: "Grocery list.") }

	before do
		sign_in post.user, password: "treehouse1"
	end

	it "successfully when clicking the destroy link" do
		visit "/posts"
		
		#puts page.body

		within "#post_#{post.id}" do
			click_link "Destroy"
		end
		
		expect(page).to_not have_content(post.title)
		expect(Post.count).to eq(0)
	end
end


