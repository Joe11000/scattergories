class GamesController < ApplicationController
  # before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    # PregameSetup.call if Category.count == 0 # right now nothing is being saved in the database
    @categories = PregameSetup.send(:categories).sample 12

    possible_letter_to_start_with = ('A'..'Z').to_a - %w(Q U V X Y Z)
    @letter_that_answers_must_start_with = possible_letter_to_start_with.sample
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    score = ScoreCalculator.call game_params

    redirect_to new_game_path, notice: "score: #{score}"
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
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
    # def set_game
    #   @game = Game.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:letter_that_answers_must_start_with, answers: {})
    end
end
