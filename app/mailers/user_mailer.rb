class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Salut"

    mail to: @user.email, subject:"Bienvenue #{@user.email}"
  end
  def prevent(user)
    @user = user
    @greeting = "Salut"

    mail to: @user.email, subject:"BOITTT #{@user.email}"
  end

end
