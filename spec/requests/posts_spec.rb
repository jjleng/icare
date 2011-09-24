require 'spec_helper'

describe "Posts" do

  describe "GET /posts" do
    it "should be successful" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get posts_path
      response.status.should be(200)
    end
  end



  describe "new post" do

    it "should redirect a guest user to log in" do
      visit new_post_path
      response.should have_selector("label", :content => "Email")
    end

    it "should not create a new post without a title" do
      user = Factory(:valid_user)
      visit new_post_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button

      fill_in "Title", :with => ""
      fill_in "Content", :with => "Some text"
      fill_in "Price", :with => 10
      click_button
      response.should have_selector("div#error_explanation")
    end
  end
end
