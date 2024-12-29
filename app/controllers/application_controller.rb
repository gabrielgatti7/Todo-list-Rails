class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_sidebar_lists

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def routing_error
    redirect_to root_path, alert: "Página não encontrada."
  end

  private

  def load_sidebar_lists
    @sidebar_lists = List.all   # Add a database query and assign it to an instance variable (starts with @) to make it available to the view
  end

  def record_not_found
    redirect_to root_path, alert: "Registro não encontrado."
  end
end
