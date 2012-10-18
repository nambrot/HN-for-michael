class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts request.env['omniauth.auth'].keys
    @user = User.find_by_facebook_id(request.env['omniauth.auth']['info']['uid'])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      puts 'error'
    end
  end
end