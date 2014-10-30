class User < ActiveRecord::Base
require File.expand_path("../../../spec/rails_helper", __FILE__)
  validates :email, presence: true,
	            uniqueness: true
end
