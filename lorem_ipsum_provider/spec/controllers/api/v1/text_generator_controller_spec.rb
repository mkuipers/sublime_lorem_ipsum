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
end
