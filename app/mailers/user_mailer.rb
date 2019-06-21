class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome

    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to One Racquet')
    # This will render a view in `app/views/user_mailer`!
  end

  def booking
    @booking = params[:booking]
<<<<<<< HEAD
    mail(to: @user.email, subject: 'Booking made')
=======
    @user = @booking.user
    mail(to: @booking.offer.user.email, subject: 'Booking made')
>>>>>>> bc40abcc3dbf344d1744483bc6b30d974146c36f
  end
end
