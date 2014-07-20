require "spec_helper"

describe Api::V1::TextGeneratorController do
  describe "success" do
    describe "with paragraphs" do
      before do
        get :filler, paragraphs: 5
      end

      it "returns the appropriate response" do
        expect(response.body).to eq(LoremIpsum.lorem_ipsum(paragraphs: 5))
      end
    end

    describe "with template" do
      let(:bacon_ipsum) { { name: "bacon", filler_text: "bacon ipsum meat drumstick turducken rump shankle" } }
      before do
        #TODO - use factories
        Template.create!(bacon_ipsum)
        get :filler, template: "bacon"
      end

      it "returns the expected filler text" do
        expect(response.body).to eq(bacon_ipsum[:filler_text])
      end
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
