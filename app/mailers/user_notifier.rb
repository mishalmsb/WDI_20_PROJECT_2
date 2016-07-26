class UserNotifier < ApplicationMailer
  default :from => 'mishalgastudent@gmail.com'

  def inform_bet_winner_email(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'Wou won the bet' )
    end
end

