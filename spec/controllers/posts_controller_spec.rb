require File.expand_path("../../../spec/rails_helper", __FILE__)

RSpec.describe PostsController, :type => :controller do

	let(:valid_attributes){ { "title" => 'Title', "body" => "This is body" } }

	let(:valid_session){{}}

	before do
		sign_in(build_stubbed(:user))
	end	

	describe "GET index" do

		context "logged in" do
			it "assigns all post as @post" do
				post = Post.create! valid_attributes			
				get :index, {}, valid_session
				assigns(:posts).should eq([post])
			end
		end
	end


end
