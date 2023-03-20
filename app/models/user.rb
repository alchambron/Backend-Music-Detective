class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates_uniqueness_of :nickname
  before_save :set_nickname
  validates :email, uniqueness: true

  private

  def set_nickname
    self.nickname = Faker::Superhero.descriptor if nickname.nil? || nickname == Faker::Superhero.descriptor
  end

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
