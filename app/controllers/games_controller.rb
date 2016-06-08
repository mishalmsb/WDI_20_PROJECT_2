class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @bets = Bet.all
    @games = Game.all
    @date = Time.now.strftime("%Y-%m-%d")
    @time = Time.now.strftime("%H%M").to_i
    
    @upcoming_games = Game.where("date >= ? AND finish_time >= ?", "#{@date}","#{@time}")
    @todays_games = Game.where("date = ? AND finish_time > ?", "#{@date}","#{@time}")
    # @finished_game = Game.where("date < ? AND finish_time < ?", "#{@date}","#{@time}")
  end

  # GET /games/1
  # GET /games/1.json
  def show

    # @upcoming_games = Game.where(returned_date: nil)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit

  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update


    
    respond_to do |format|
      if @game.update(game_params)
        if @game.winner != "" || @game.winner != nil
            update_everything(@game.id)
        end
        
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:team_one, :team_two, :winner, :date, :time, :finish_time)
    end

    def update_everything(gameid)

      
      @this_game_bets = Bet.where("game_id = ?", gameid)
      @this_game_bets.each do |bet|
          bet.update_attribute(:status, "finished")
          if @game.winner == "1"
            credit_user(bet.user.email, bet.value)
          end
          if @game.winner == "2"
            credit_user(bet.user_two.email, bet.value)
          end
      end  

    end

    def update_bet
      
    end

    def credit_user(user_email, add_money)
        user = User.find_by_email(user_email)
        user_new_money = user.money + add_money
        user.update_attribute(:money, user_new_money)

        #puts "*****************************************************************#{user_new_money}"
    end

end
