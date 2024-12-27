class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_sidebar_lists

  private

  def load_sidebar_lists
    @sidebar_lists = List.all   # Add a database query and assign it to an instance variable (starts with @) to make it available to the view
  end
end
