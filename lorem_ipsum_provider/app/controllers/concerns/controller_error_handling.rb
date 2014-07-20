module Concerns::ControllerErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing, with: :handle_missing_param
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  end

  def handle_missing_param(exception)
    render json: [exception.to_s].to_json, status: :bad_request
  end

  def handle_not_found(exception)
    render json: [exception.to_s].to_json, status: :not_found
  end
end
