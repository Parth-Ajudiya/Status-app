class UserMailer < ApplicationMailer
    def new_user_email
        @user = params[:user]
    
        mail(to: 'parthajudiya96647@gmail.com', subject: "Training - Status - Date( 16 Sep, 2021 )")
      end
end
