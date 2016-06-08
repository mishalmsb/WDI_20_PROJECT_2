class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  require "benchmark"
  require 'timeout'

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
    @game = Game.find(params[:game])
    @mybet = (params[:team])
  end

  # GET /bets/1/edit
  def edit
    if @bet.user_id != nil
        @mybet = "team_one"
    elsif @bet.user_two_id != nil
        @mybet = "team_two"
    end
    # @better = @bet.user_id
    # @mybet = "team_one"
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)
    UserNotifier.inform_bet_winner_email(current_user).deliver
    puts "aaBFVSFhagdlGSDABCSBcjsbcSCBgvkHASGDXASDGNHSGDks#{current_user.email}"
    # puts "IULIUYBIPHIHILUHPIUHPIHPIHPI #{bet_amount}"
    # puts "HUHDOUHUYGUYGBUGBKVYIUUGU#{current_user.money}"
    user_new_money = current_user.money - bet_params[:value].to_i
    current_user.update_attribute(:money, user_new_money)

    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        # User.find(current_user.id).user.update_attributes(:money => 90)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    puts "****************************************#{current_user.id}"
    puts "****************************************#{current_user.value}"
    puts "****************************************#{}"

    @game = Game.find(params[:game])
    
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:user_id, :user_two_id, :value, :status, :game_id)
    end

end
