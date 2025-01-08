class PasswordsMailer < ApplicationMailer
  def reset(user)
    @user = user
    @token = @user.generate_password_reset_token # Bạn cần tạo method này trong model User
    mail(to: @user.email_address, subject: 'Reset Your Password')
  end
end
