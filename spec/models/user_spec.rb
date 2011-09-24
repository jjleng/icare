require 'spec_helper'



describe User do

  let(:user) { Factory.build(:valid_user) }

  it "can be saved" do
    expect {
      user.save!
    }.should change(User, :count).by(1)

  end

  it "should not save a user without a email" do
    user.email = ""
    user.save
    user.errors[:email].should_not be_empty
  end

  it "should not save a user without a password" do
    user.password = ""
    user.save
    user.errors[:password].should_not be_empty
  end

  it "should not save a user if password is different from password_confirmation" do
    user.password = "123456"
    user.password_confirmation = "654321"
    user.save
    user.errors[:password].should_not be_empty
  end
end
