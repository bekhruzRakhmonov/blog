class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  before_action :require_admin_for_admin_routes
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end


  private


  def render_not_found
    render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def require_admin_for_admin_routes
    if request.path.start_with?('/admin') && !current_user&.admin?
      render_not_found
    end
  end

  helper_method :current_user
end
