class SessionsController < Devise::SessionsController
def new
    super
end
    def create
        self.resource = warden.authenticate!(auth_options)
            set_flash_message(:notice, :signed_in) if is_navigational_format?
            sign_in(resource_name, resource)
            yield resource if block_given?
            respond_with resource, location: after_sign_in_path_for(resource)
    end
    
    def new
        build_resource
        yield resource if block_given?
        respond_with resource
      end
end