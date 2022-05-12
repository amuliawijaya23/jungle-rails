class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 8 }, presence: true
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    if self.authenticate(password)
      return self
    else
      return nil
    end
  end

end
