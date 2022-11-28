class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError,  with: :render_404

  def render_404
    render 'errors/not_found', :status => '404'
  end
end
