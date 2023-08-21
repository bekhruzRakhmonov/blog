class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    handle_auth "Github"
  end

  def handle_auth(kind)
    @user = User.find_for_github_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.auth_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def destroy
    if user_signed_in?
      sign_out current_user
      flash[:notice] = "Signed out successfully."
    else
      flash[:alert] = "You are not signed in."
    end
    redirect_to root_path
  end
end