require 'spec_helper'

describe "geo_search/search.html.erb" do
  it "should have geo search form" do
    render
    response.should have_selector("form") do |form|
      form.should have_selector("input[type=submit]", :value => "Search")
      form.should have_selector("input[type=text]", :name => "origin")
      form.should have_selector("input[type=text]", :name => "within")
    end
  end
end
