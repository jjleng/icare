require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "post1",
        :content => "content1",
        :location => "San Jose, CA",
        :created_at => Time.local("2011")
      ),
      stub_model(Post,
        :title => "post2",
        :content => "content2",
        :location => "San Francisco, CA",
        :created_at => Time.local("2011")
      )
    ])
  end

  it "renders a list of posts" do
    render

    response.should have_selector(".posts") do |post|
        post.should have_selector(".post_title", :content => "post1")
        post.should have_selector(".post_title", :content => "post2")
      end
  end

  it "renders a geo code filter" do
    render
    response.should have_selector("form") do |form|
      form.should have_selector("input[type=submit]", :value => "Search")
      form.should have_selector("input[type=text]", :name => "origin")
      form.should have_selector("input[type=text]", :name => "within")
    end
  end
end
