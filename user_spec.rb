require 'rspec'
require './user'

RSpec.describe User do
  describe ".new" do
    context "with block params" do
      it "should create the object with the valid attributes" do
      end
    end
    context "with hash params" do
      it "should create the object with the valid attributes" do
      end
    end
    context "without params" do
      it "should create the object" do
        new_user = User.new
        expect(new_user.name).to be_nil
        expect(new_user.last_name).to be_nil
      end
    end
  end
end
