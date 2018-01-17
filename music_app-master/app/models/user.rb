class User < ApplicationRecord
  validates :email, :password_digest, :session_key, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password #why do we need this?
  after_initialize :ensure_session_key

  def self.find_by_credentials(user_params)
    @user = User.find_by(email: user_params[:email])
    return nil if @user.nil?

    if @user.is_password?(user_params[:password])
      return @user
    end

    nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_key!
    self.session_key = SecureRandom.urlsafe_base64
    self.save!
    self.session_key
  end

  private

  def ensure_session_key
    self.session_key ||= SecureRandom.urlsafe_base64
  end
end
