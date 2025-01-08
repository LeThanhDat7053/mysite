class PasswordsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_user_by_token, only: %i[ edit update ]

  def new
    # Render form cho việc nhập email để gửi liên kết reset mật khẩu
  end

  def create
    if user = User.find_by(email_address: params[:email_address])
      PasswordsMailer.reset(user).deliver_later
    end

    redirect_to new_session_path, notice: "Password reset instructions sent (if user with that email address exists)."
  end

  def edit
    # Hiển thị form thay đổi mật khẩu
  end

  def update
    if @user.update(password_params)
      redirect_to new_session_path, notice: "Password has been reset."
    else
      flash.now[:alert] = "Passwords did not match or are invalid."
      render :edit
    end
  end

  private

  def set_user_by_token
    @user = User.find_by_password_reset_token!(params[:token])
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_password_path, alert: "Password reset link is invalid or has expired."
  end

  def password_params
    params.permit(:password, :password_confirmation)
  end
end
