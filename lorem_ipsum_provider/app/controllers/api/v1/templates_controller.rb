class Api::V1::TemplatesController < ApplicationController
  include Concerns::ControllerErrorHandling
  respond_to :json

  def create
    @template = Template.create!(template_params)
    render json: @template
  end

  private

  def template_params
    t = params.require(:template)
    head bad_request and return if t[:id]
    t.permit(:name, :filler_text)
  end
end