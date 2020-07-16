class SessionsController < Devise::SessionsController
  def new
    p resource_name
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    session[:user_id] = resource.id
    respond_with resource, location: questions_path
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    session[:user_id] = nil
    respond_to_on_destroy
  end
end