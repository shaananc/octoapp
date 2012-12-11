class RegistrationsController < Devise::RegistrationsController
  def create

    puts ENV['SENDGRID_USERNAME']
    puts ENV['SENDGRID_PASSWORD']
    build_resource
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        return render:action => 'people/date'
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render:partial => 'waiting'
      end
    else
      clean_up_passwords resource
      if xhr?
        return render action: "new", :layout => false
      else
        return render action: "new"
      end

    end
  end

  def sign_up(resource_name, resource)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end

  def failure
    if xhr?
      return render:json => {:success => false, :errors => ["signed_up_but_#{resource.inactive_message}"]}
    else
    super
    end
  end

  def xhr?
    return request.headers['HTTP_X_REQUESTED_WITH'] == "XMLHttpRequest"
  end

end