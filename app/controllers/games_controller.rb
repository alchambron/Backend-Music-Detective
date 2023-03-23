class GamesController < ApplicationController
before_action :set_game, only: %i[ show update destroy]
  def index
    @games = Game.all
    render json: @games
  end

  def get_user_stats
    @game = Game.where(get_stats_params)

    render json: @game
  end

  def show
    render json: @game
  end

  def create
    @game = Game.new(game_params)

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
    params.permit(:score, :user)
  end

  def get_stats_params
    params.permit(:user)
  end
end
