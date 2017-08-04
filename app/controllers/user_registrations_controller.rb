class UserRegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session

  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end
end