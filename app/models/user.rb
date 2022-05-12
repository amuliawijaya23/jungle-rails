class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }

  def authenticate_with_credentials(email, password)
    if self.authenticate(password)
      return self
    else
      return nil
    end
  end

end
