class ApplicationController < ActionController::Base
  p "vt: now in ApplicaitonController"
  protect_from_forgery with: :exception
  # vt add
  # the following based on info at http://www.yihangho.com/rails-cross-origin-resource-sharing/
  #
  # allow_cors takes in arbitrarily many symbols representing actions that
  # CORS should be enabled for

  # Note: this cors stuff has no effect. I think the problem might be that this
  # needs to be added to 'config/application.rb', not 'ApplicaitonController'?
  # Anyways, the cors middleware fixes the problem.  You should be able to
  # delete this.
  def self.allow_cors(*methods)
    # before_filter :cors_before_filter, :only => methods
    before_action :cors_before_filter, :only => methods

    # Rails recommends to use :null_session for APIs
    protect_from_forgery with: :null_session, :only => methods
  end

  def cors_before_filter
    p "vt.cors_before_filter: origin=#{request.headers['Origin']}"
    # Check that the `Origin` field matches our front-end client host
    if /\Ahttps?:\/\/localhost:4200\z/ =~ request.headers['Origin']
      # allow for cases where ng2 server is running on game-pc
      p "vt: matching cors_before_filter"
      headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    elsif /\Ahttps?:\/\/192.168.50.\d{1,3}:4200\z/ =~ request.headers['Origin']
      # allow for cases where ng2 server is running on laptop.
      p "vt: matching 192.168.50"
      headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    end
  end
   # end
end
