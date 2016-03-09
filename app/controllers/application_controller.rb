class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def render_404
      render file: 'public/404.html', status: :not_found, layout: false
    end

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
