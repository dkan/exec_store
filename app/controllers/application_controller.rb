class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain
  
  def ensure_domain
    if Rails.env.production?
        if !request.ssl?
            redirect_to "https://store.iamexec.com#{request.fullpath}", :status => 301
        end
    end
  end
  
end
