require "test_helper"

class PlaylistContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playlist_content = playlist_contents(:one)
  end

  test "should get index" do
    get playlist_contents_url, as: :json
    assert_response :success
  end

  test "should create playlist_content" do
    assert_difference("PlaylistContent.count") do
      post playlist_contents_url, params: { playlist_content: { playlist_id: @playlist_content.playlist_id, youtube_id: @playlist_content.youtube_id, youtube_title: @playlist_content.youtube_title } }, as: :json
    end

    assert_response :created
  end

  test "should show playlist_content" do
    get playlist_content_url(@playlist_content), as: :json
    assert_response :success
  end

  test "should update playlist_content" do
    patch playlist_content_url(@playlist_content), params: { playlist_content: { playlist_id: @playlist_content.playlist_id, youtube_id: @playlist_content.youtube_id, youtube_title: @playlist_content.youtube_title } }, as: :json
    assert_response :success
  end

  test "should destroy playlist_content" do
    assert_difference("PlaylistContent.count", -1) do
      delete playlist_content_url(@playlist_content), as: :json
    end

    assert_response :no_content
  end
end
