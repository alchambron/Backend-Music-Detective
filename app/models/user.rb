class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
    :jwt_authenticatable,
    jwt_revocation_strategy: JwtDenylist

  before_save :set_nickname
   has_many :games
  private

  def set_nickname
    self.nickname = Faker::Superhero.descriptor
  end

  # after_create :welcome_send
  # def welcome_send
  #   UserMailer.welcome_email(self).deliver_now
  # end

end

