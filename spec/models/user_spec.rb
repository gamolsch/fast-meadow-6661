require 'spec_helper'

describe User do

	let(:user) { User.create(first_name: "George", last_name: "Amolsch", email: "gamolsch@gmail.com", password: "1234") }


############################################################
# 			The following tests are ATTRIBUTE tests						#
############################################################

  it("should return correct first name") do
  	expect(user.first_name).to eq("George")
  end

  it("should return correct last name") do
  	expect(user.last_name).to eq("Amolsch")
  end

  it("should return correct email") do
  	expect(user.email).to eq("gamolsch@gmail.com")
  end

  it("should return correct password") do
  	expect(user.password).to eq("1234")
  end

  describe "#full_name" do
  	it "should return the full name" do
  		expect(user.full_name).to eq("George Amolsch")
  	end
  end

  #ENDTEST

############################################################
# 			The following tests are ASSOCIATION tests					#
############################################################


end