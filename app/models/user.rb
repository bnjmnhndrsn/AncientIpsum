class User < ActiveRecord::Base
  
  attr_reader :password
  
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :reset_session_token!
  
  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil 
  end
  
  def User.new_session_token
    SecureRandom.urlsafe_base64
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end
  
  def password_digest
    BCrypt::Password.new(super)
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = User.new_session_token
  end
  
end
