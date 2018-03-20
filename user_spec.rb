require 'rspec'
require './user'

RSpec.describe User do
  describe ".new" do
    context "with block params" do
      context "the block exists" do
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
      context "the block is empty" do
        it "should create just the object" do
          new_user = User.new {|user| user}
          expect(new_user.name).to be_nil
          expect(new_user.last_name).to be_nil
        end
      end
    end
    context "with hash params" do
      let(:params) { { name: "David", last_name: "Valderrama", another_key: "Hi" } }
      context "the params exists" do
        it "should create the object with the valid attributes" do
          new_user = User.new(params)
          expect(new_user.name).to eq("David")
          expect(new_user.last_name).to eq("Valderrama")
          expect(new_user.respond_to?(:another_method)).to be_falsey
        end
      end
      context "the params are empty" do
        it "should create just the object" do
          new_user = User.new({})
          expect(new_user.name).to be_nil
          expect(new_user.last_name).to be_nil
          expect(new_user.respond_to?(:another_method)).to be_falsey
        end
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
