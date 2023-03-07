class PlaylistContentsController < ApplicationController
  before_action :set_playlist_content, only: %i[show update destroy]
  require 'yt'

  Yt.configuration.api_key = 'AIzaSyCFT7vH21ACuKywAblX0SzeD4uAA2594JI'

  def add_song_playlist_content
    def get_playlist_videos(playlist_url, playlist_id)
      playlist = Yt::Playlist.new id: playlist_url

      playlist.playlist_items.each do |video|
        existing_item = PlaylistContent.find_by(youtube_title: video.title)

        if existing_item
          puts 'nope'
        else
          PlaylistContent.create(youtube_title: video.title, playlist_id: playlist_id)
        end
      end
    end

    # Parcourt toutes les playlists de manière asynchrone
    Playlist.all.each do |content|
      get_playlist_videos(content.playlist_url, content.id).load_async
    end
  end

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
