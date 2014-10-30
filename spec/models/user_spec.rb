#require 'rails_helper'
require File.expand_path("../../rails_helper", __FILE__)

#RSpec.describe User, :type => :model do

describe User do

 #{{{ Create User with valid attributes
   let(:valid_attributes){
    {
      first_name: "Bertan",
      last_name: "ULUSOY",
      email: "bertan_ulusoy@yahoo.com"
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
  end 
  #}}}

end
