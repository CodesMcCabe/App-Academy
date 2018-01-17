class User < ApplicationRecord


  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, :password_digest, :session_token, presence: true, uniqueness: true


  has_many :links
  has_many :comments

  after_initialize :ensure_session_token

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64 # why does this break if ||= is not implemented?
  end
end
