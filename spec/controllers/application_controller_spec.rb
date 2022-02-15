require "rails_helper"

RSpec.describe ApplicationController, :type => :controller do
  it "should load landing page successfully" do
    get :index
    expect(response.content_type).to eq "text/html; charset=utf-8"
    expect(response.status).to eq 302
  end
end
