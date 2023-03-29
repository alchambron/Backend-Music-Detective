class Playlist < ApplicationRecord
  has_many :playlist_contents, dependent: :nullify
end
