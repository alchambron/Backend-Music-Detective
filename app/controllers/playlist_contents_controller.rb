class PlaylistContentsController < ApplicationController
  before_action :set_playlist_content, only: %i[ show update destroy ]

  # GET /playlist_contents
  def index
    @playlist_contents = PlaylistContent.all

    render json: @playlist_contents
  end

  # GET /playlist_contents/1
  def show
    render json: @playlist_content
  end

  # POST /playlist_contents
  def create
    @playlist_content = PlaylistContent.new(playlist_content_params)

    if @playlist_content.save
      render json: @playlist_content, status: :created, location: @playlist_content
    else
      render json: @playlist_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlist_contents/1
  def update
    if @playlist_content.update(playlist_content_params)
      render json: @playlist_content
    else
      render json: @playlist_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlist_contents/1
  def destroy
    @playlist_content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist_content
      @playlist_content = PlaylistContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_content_params
      params.require(:playlist_content).permit(:youtube_title, :youtube_id, :playlist_id)
    end
end
