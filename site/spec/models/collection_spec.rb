require 'spec_helper'

describe Collection do
  before(:each) do 
    @attr = {
      user: create(:user),
      title: "A Collection"
    }
  end

  it "should create a new instance with valid attributes" do
    Collection.create!(@attr)
  end

  it "should require a user" do
    no_user_collection = Collection.new(@attr.merge(user: nil))
    no_user_collection.should_not be_valid
  end

  it "should require a title" do
    no_title_collection = Collection.new(@attr.merge(title: nil))
    no_title_collection.should_not be_valid
  end

  it "should require unique titles with the same user" do
    Collection.create(@attr)
    duplicate_user_collection = Collection.new(@attr) 
    duplicate_user_collection.should_not be_valid

    new_user_collection = Collection.new(@attr.merge(user: create(:user2)))
    new_user_collection.should be_valid   
  end
end
