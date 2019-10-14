require "rails_helper"

RSpec.describe "Index page", type: :request do
  it "redirects to index on root" do
    get "/"
    expect(response).to render_template(:index)

    expect(response.body).to include("Header")
    expect(response.body).to include("Index!")
    expect(response.body).to include("Footer")
  end
end
