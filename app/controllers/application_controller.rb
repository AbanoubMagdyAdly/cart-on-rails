class ApplicationController < ActionController::Base
  def not_found
    render json: { error: 'not found' }
  end

end
