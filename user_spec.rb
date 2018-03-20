require 'rspec'
require './user'

RSpec.describe User do
  describe ".new" do
    context "with block params" do
      it "should create the object with the valid attributes" do
        new_user = User.new do |user|
          user.name = "David"
          user.last_name = "Valderrama"
          user.another_method = "Hi"
        end
        expect(new_user.name).to eq("David")
        expect(new_user.last_name).to eq("Valderrama")
        expect(new_user.respond_to?(:another_method)).to be_falsey
      end
    end
    let(:params) { { name: "David", last_name: "Valderrama", another_key: "Hi" } }
    context "with hash params" do
      it "should create the object with the valid attributes" do
        new_user = User.new(params)
        expect(new_user.name).to eq("David")
        expect(new_user.last_name).to eq("Valderrama")
        expect(new_user.respond_to?(:another_method)).to be_falsey
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
