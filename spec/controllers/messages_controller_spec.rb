require "rails_helper"

RSpec.describe MessagesController, :type => :controller do
  before(:each) do
    user = FactoryBot.create(:user)
    log_in(user)
  end

  it "should return no content" do
    post :create, :params => { message: { content: nil } }
    expect(response.status).to eq(204)
  end
end

