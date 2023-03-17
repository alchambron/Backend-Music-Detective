class GamesController < ApplicationController
before_action :set_game, only: %i[ show update destroy]
  def index
    @games = Game.all
    render json: @games
   

  end

  def show
    render json: @game
  end

  def create
    @game = Game.new()

   if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
   if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
  end

  private
  def set_game
    @game= Game.find(params[:id])

  end
  def game_params
    params.permit(:score)
  end
end
