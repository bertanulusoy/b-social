#require 'rails_helper'
require File.expand_path("../../rails_helper", __FILE__)

#RSpec.describe User, :type => :model do

describe User do

 #{{{ Create User with valid attributes
   let(:valid_attributes){
   {
      first_name: "Bertan",
      last_name: "ULUSOY",
      email: "bertan_ulusoy@yahoo.com",
      password: "treehouse1234",
      password_confirmation: "treehouse1234"
    }
  }
 #}}}

 #{{{ Test Validations
  context "validations" do
    let(:user){ User.new(valid_attributes) }	  
    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

   it "requires a unique email (case insensitive)" do
     user.email = "BERTAN_ULUSOY@YAHOO.COM"
     expect(user).to validate_uniqueness_of(:email)
   end

   it "requires the email address to look like an email" do
     user.email ="jason"
     expect(user).to_not be_valid 
   end 
  
  end 
  #}}}
  
  #{{{
  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "BERTAN_ULUSOY@YAHOO.COM"))
      #user.downcase_email
      #expect(user.email).to eq("bertan_ulusoy@yahoo.com")
      expect{ user.downcase_email }.to change { user.email }.
	    from("BERTAN_ULUSOY@YAHOO.COM").
	    to("bertan_ulusoy@yahoo.com")
    end

    it "downcase an email before saving" do
      user = User.new(valid_attributes)
      user.email ="MIKE@TEAMTREEHOUSE.COM"
      expect(user.save).to be_truthy
      expect(user.email).to eq("mike@teamtreehouse.com")
    end

  end
#}}}

end
