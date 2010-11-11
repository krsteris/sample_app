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

  attr_accessible :name,:email

  validates_presence_of :name,:email
  validates_length_of   :name, :maximum => 50

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of   :email, :with => EmailRegex
  #email so golemi i so mali bukvi ke e ist t.e duplikat
  #i nema da dozvolva da se zacuva
  validates_uniqueness_of :email, :case_sensitive => false

  
end
