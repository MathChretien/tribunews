class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :photo_cache])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :photo_cache])
  end
end

# Make sure your production HOST variable is set with your domain name.
# If you deploy your code with Heroku for instance, just type in your
# terminal heroku config:set HOST=www.my_product.com

# You can check it's properly set with heroku config:get HOST.
