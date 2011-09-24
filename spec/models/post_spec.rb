require 'spec_helper'

describe Post do

  let(:post) { Factory.build(:valid_post) }

  it "can be saved" do
    expect {
      post.save
    }.should change(Post, :count).by(1)
  end

  it "should not be saved without a title" do
    subject.save
    subject.errors[:title].should_not be_empty
  end

  context "should be saved" do
    [:price, :location, :content].each do |m|
      it "without a #{m}" do
        subject.save
        subject.errors[m].should be_empty
      end
    end
  end

  it "should destroy associated assets" do
    post = Factory(:valid_post)
    asset = Factory(:valid_asset, :post => post)
    post.destroy
    Asset.find_by_id(asset.id).should be_nil
  end

end
