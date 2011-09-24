require 'spec_helper'

describe Asset do
  it "can be saved with a valid post id" do
    post = Factory(:valid_post)
    asset = Factory.build(:valid_asset, :post => post)
    expect {
      asset.save
    }.should change(Asset, :count).by(1)
  end
end
