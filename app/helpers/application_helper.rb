module ApplicationHelper
  
  def is_admin
      current_user && current_user.admin? 
  end

  def my_bets
      @my_bets = Bet.where("user_id = ? OR user_two_id = ?", current_user.id, current_user.id)
  end
  

end
