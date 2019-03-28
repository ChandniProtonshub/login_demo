class User < ApplicationRecord

	# validate :password_complexity
 #  validate :email_require
  # validates :first_name, :last_name, :dob, :email, :mobile, presence: true
  before_save :encrypt_password1
  after_save :clear_password

# def password_complexity
#   return if encrypted_password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/
#   errors.add :password, 'Complexity requirement not met. Length should be 6-20 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
# end

# def email_require
#   return if email.blank? || email =~ /@./
#   errors.add :email, 'Email should have @ or .'
# end


def encrypt_password1
  if encrypted_password.present?
     salt = BCrypt::Engine.generate_salt
     self.encrypted_password= BCrypt::Engine.hash_secret(encrypted_password, salt)
  end
 end
 
 def clear_password
  self.encrypted_password = nil
 end
end
