require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should validate uniqueness of name" do
    user1 = FactoryBot.create(:user, username: "username123")
    user1.save

    user2 = FactoryBot.build(:user,  username: "username123")
    expect { user2.save! }.to raise_error(
                                ActiveRecord::RecordInvalid
                              )
  end

  it "should validate creation of user" do
    user = User.new(username: "username123")

    expect(user.username).to eql("username123")
  end
end
