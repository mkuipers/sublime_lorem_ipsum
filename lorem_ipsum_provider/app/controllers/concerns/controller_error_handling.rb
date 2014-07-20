module Concerns::ControllerErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing, with: :handle_missing_param
  end

  def handle_missing_param(exception)
    render json: [exception.to_s].to_json, status: :bad_request
  end
end
