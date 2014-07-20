require "spec_helper"

describe Api::V1::TextGeneratorController do
  describe "success" do
    before do
      get :filler, paragraphs: 5
    end

    it "returns the appropriate response" do
      expect(response.body).to eq(LoremIpsum.lorem_ipsum(paragraphs: 5))
    end
  end

  describe "failure" do
    before do
      get :filler
    end
    it "fails without a paragraph param" do
      expect(response).to be_bad_request
    end
  end
end
