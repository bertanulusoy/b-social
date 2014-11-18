require File.expand_path("../../../spec/rails_helper", __FILE__)

RSpec.describe Post, :type => :model do

	context "relationships" do	
		it { should belong_to(:user) }
	end
end
