# == Schema Information
# Schema version: 20101111192003
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#



class User < ActiveRecord::Base

  #ova e isto znaci validate_presence_of e metota 
  #class User < ActiveRecord::Base
  #attr_accessible(:name, :email)
  #validates_presence_of(:name)
  
  attr_accessor :password
  attr_accessible :name,:email,:password, :password_confirmation

  validates_presence_of :name,:email
  validates_length_of   :name, :maximum => 50

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of   :email, :with => EmailRegex
  #email so golemi i so mali bukvi ke e ist t.e duplikat
  #i nema da dozvolva da se zacuva
  validates_uniqueness_of :email, :case_sensitive => false



  #ch6
  validates_confirmation_of :password
  #which will automatically create a virtual attribute called password_confirmation, while confirming that it matches the password attribute at the same time.




  #attr_accessor :password
  #attr_accessible :password, :password_confirmation

  # Automatically create the virtual attribute 'password_confirmation'.
  #validates_confirmation_of :password

  # Password validations.
  validates_presence_of :password
  validates_length_of   :password, :within => 6..40



    before_save :encrypt_password

    # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of
    # submitted_password.
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private

    def encrypt_password
      self.salt = make_salt
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

    
end
