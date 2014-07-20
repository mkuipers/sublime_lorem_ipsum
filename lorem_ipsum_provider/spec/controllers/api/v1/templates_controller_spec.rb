require "spec_helper"

describe Api::V1::TemplatesController do
  describe "#create" do
    describe "success" do
      let(:template_params) {{name: "template 1", filler_text: "some lorem ipsum filler text"}}
      before do
        post :create, format: :json, template: template_params
      end

      it "succeeds" do
        expect(response).to be_success
      end

      it "returns the created template" do
        expect(assigns(:template)).to be_present
      end

      it "creates a template with the filler text provided" do
        expect(assigns(:template).filler_text).to eq(template_params[:filler_text])
      end
      it "creates a template with the name provided" do
        expect(assigns(:template).name).to eq(template_params[:name])
      end
    end
  end
end