require 'rails_helper'

RSpec.describe Message, :type => :model do
  it "should validate presence of content" do
    message = FactoryBot.build(:message, content: nil)
    expect { message.save! }.to raise_error(
                                ActiveRecord::RecordInvalid
                              )
  end

  it "should validate presence of user" do
    message = FactoryBot.build(:message, user: nil)
    expect { message.save! }.to raise_error(
                                  ActiveRecord::RecordInvalid
                                )
  end

  it "should validate creation of message" do
    user = User.new(username: "username123")
    message = Message.new(content: "Lorem ipsum", user: user)

    expect(message.content).to eql("Lorem ipsum")
    expect(message.user).to eql(user)
  end
end

