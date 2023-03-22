class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

       
  validates_uniqueness_of :nickname
  before_save :set_nickname, :set_is_admin
  validates :email, uniqueness: true

  private

  def set_nickname
    self.nickname = Faker::Superhero.descriptor if nickname.nil? || nickname == Faker::Superhero.descriptor
  end

  def set_is_admin
    self.is_admin = false
  end

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
