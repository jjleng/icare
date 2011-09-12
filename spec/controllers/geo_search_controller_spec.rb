require 'spec_helper'

describe GeoSearchController do

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
