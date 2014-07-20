class Api::V1::TextGeneratorController < ApplicationController
  respond_to :json

  def filler
    render json: LoremIpsum.lorem_ipsum(paragraphs: paragraphs)
  end

  private

  def paragraphs
    params.require(:paragraphs).to_i
  end
end