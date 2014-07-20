class Api::V1::TextGeneratorController < ApplicationController
  include Concerns::ControllerErrorHandling
  respond_to :json

  def filler
    if template_name
      #if a template name is provided, use that
      template = Template.find_by!(name: template_name)
      render json: template.filler_text
    else
      #otherwise, default to LoremIpsum gem generation
      render json: LoremIpsum.lorem_ipsum(paragraphs: paragraphs)
    end
  end

  private

  def paragraphs
    params.require(:paragraphs).to_i
  end

  def template_name
    params[:template]
  end
end