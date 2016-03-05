class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def saved_chunk_number
    params[:chunk_number]
  end

  helper_method :saved_chunk_number

  protected

    def authorize!
      return unless Rails.env == 'production'
      unless authenticate_with_http_basic { |u, p| authenticate(u, p) }
        request_http_basic_authentication
      end
    end

    def authenticate(username, password)
      return false unless username == ENV['MVP_USERNAME']
      return false unless password == ENV['MVP_USERPASS']
      true
    end
end
