class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
  	render file: "#{Rails.root}/public/404.html", layout: true, status: 404
  end
end
