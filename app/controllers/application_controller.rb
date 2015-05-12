class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def should_publish? resource
    params[resource] && params[resource][:published] == 'true'
  end

  def should_toggle_publish? obj
    resource_key = obj.class.to_s.downcase.to_sym
    params[resource_key] && params[resource_key][:published] != obj.published?.to_s
  end
end
