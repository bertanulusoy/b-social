require File.expand_path("../../../spec/rails_helper", __FILE__)

RSpec.describe PostsController, :type => :controller do

	let(:valid_attributes){ { "title" => 'Title', "body" => "This is body" } }

	let(:valid_session){{}}

	let!(:user) { create(:user) }
	
	before do
		sign_in(user)
	end	

	describe "GET index" do

		context "logged in" do
			it "assigns all post as @post" do
				post = user.posts.create! valid_attributes #Post.create! valid_attributes			
				get :index, {}, valid_session
				assigns(:posts).should eq([post])
			end
		end
	end

	describe "POST create" do	
		it "creates a post for the current user" do
			post :create, {:post => valid_attributes}, valid_session
			post = Post.last
			expect(post.user).to eq(user)
		end
	end
	
	it "does not allow users to create posts for other users" do
		other_user = create(:user)
		post :create, {:post => valid_attributes.merge(user_id: other_user.id)}, valid_session
		post = Post.last
		expect(post.user).to eq(user)
	end

end
