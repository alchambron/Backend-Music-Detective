class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :jwt_authenticatable,
    jwt_revocation_strategy: JwtDenylist

  before_save :set_nickname

  private

  def set_nickname
    self.nickname = Faker::Superhero.descriptor
  end
end
