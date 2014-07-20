class Api::V1::TextGeneratorController < ApplicationController
  respond_to :json

  def filler
    render json: "Lorem Ipsum ya dingus"
  end
end