require "spec_helper"

describe Api::V1::TextGeneratorController do
  before do
    get :filler
  end

  it "returns the appropriate response" do
    expect(response.body).to eq("Lorem Ipsum ya dingus")
  end
end
