class SessionsController < Devise::SessionsController
  
    
      def create
        super
        return
    resource = warden.authenticate!(:scope => resource_name, :recall => :failure)

    return sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    super
    return
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end

  def failure
    
    super
    return
    #return render:json => {:success => false, :errors => ["Login failed."]}
  end
    
  

end