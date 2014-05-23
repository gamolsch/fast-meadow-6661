require 'spec_helper'

describe ItemsController do
  describe "index" do
    it "sets up the expired percent" do
      expect(Item).to receive(:expired_percent).and_return(42)    # Tests the controller to ensure there is a method being called and that that method does something, don't care what.
      get :index                                                  # Makes http request through controller so it can get the response back
      expect(assigns(:expired_percent)).to eq(42)                 # Test to ensure that the result is being returned by a variable it was assigned to.
    end

    it "gives the almost expired percent" do
      expect(Item).to receive(:almost_expired_percent).and_return(100)
      get :index
      expect(assigns(:almost_expired)).to eq(100)
    end

    it "gives the percent of items not expired or soon to be expired" do
      expect(Item).to receive(:not_pending_expired).and_return(100)
      get :index
      expect(assigns(:not_pending_expired)).to eq(100)
    end
  end
end










