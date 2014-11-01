#require '../../rails_helper'
require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe UsersController, :type => :controller do
let(:valid_attributes){ {
  "first_name" => "First Name",
  "last_name" => "Last Name",
  "email" => "email@example.com",
  "password" => "password12345",
  "password_confirmation" => "password12345"
} }

let(:valid_session){ {} }

describe "GET new" do
  it "assigns a new user as @user" do
    get :new, {}, valid_session
    assigns(:user).should be_a_new(User)  
  end
end

describe "GET edit" do
  it "assigns the requested user as @user" do
    user = User.create! valid_attributes
    get :edit, {:id => user.to_param}, valid_session
    assigns(:user).should eq(user)
  end
end

describe "POST create" do
  describe "with valid params" do
    it "creates a new User" do
      expect{
      }
    end
  end
end
end
