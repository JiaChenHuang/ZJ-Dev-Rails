class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    # @greeting = "Hi"
    # mail to: "to@example.org"
    @user = user
    mail to: user.email, subject: '账户激活'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.user_mailer.password_reset.subject
  def password_reset(user)
    @user = user
    mail to: user.email, subject: '重置密码'
  end
end
