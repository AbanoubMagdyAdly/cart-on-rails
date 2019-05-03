class ApiController < ActionController::Base
    # Disable csrf protection for APIs
    protect_from_forgery unless: -> { request.format.json? }

    include DeviseTokenAuth::Concerns::SetUserByToken

    def not_found
        render json: { error: 'not found' }
    end
end
