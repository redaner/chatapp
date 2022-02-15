require 'rails_helper'

RSpec.describe Message, :type => :model do
  it "should validate presence of content" do
    message = FactoryBot.build(:message, content: nil)
    expect(message.valid?).to be(false)
    expect(message.errors.messages).to include(:content)
  end

  it "should validate presence of user" do
    message = FactoryBot.build(:message, user: nil)
    expect(message.valid?).to be(false)
    expect(message.errors.messages).to include(:user)
  end

  it "should validate creation of message" do
    user = User.new(username: "username123")
    message = Message.new(content: "Lorem ipsum", user: user)
    expect(message).to be_valid
  end
end

