class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game.Game.new(params[:game])
		@game.start_game(params[:player_count])
		if @game.save
			format.html { redirect_to @game, notice: "Let's get this party started!" }
			format.json { render json: @game, status: :created, location: @game }
		else
			format.html { render action: "new" }
			format.json { render json: @game.errors, status: :unprocessable_entity }
		end
	end

	def show
		@game.Game.find(params[:id])
	end
end
