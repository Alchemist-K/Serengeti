class Users::RegistrationsController < Devise::RegistrationsController
  #before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  #회원가입 후 인증 되어있지 않음을 알려줄 때,
  def after_inactive_sign_up_path_for(resource)
    '/home/confirm_please'
  end
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:attributes])
  #end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    add_attrs = [:name, :university, :favor, :email, :password, :password_confirmation, :remeber_me, :major,
    :interest1, :interest2, :interest3]
    devise_parameter_sanitizer.permit(:account_update, keys: add_attrs)
    
    if current_user.name != nil && current_user.university != nil && current_user.favor != nil && current_user.phone_number != nil
      user_auth = User.find(current.user.id)
      user_auth.authorize = true
      user_auth.save
    end      
  end

  #The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  def after_update_path_for(resource)
    "/mypage/myinfo"
  end
end
