class User < ActiveRecord::Base
  has_many :income, :dependent => :destroy
  has_many :ep
  has_many :tn
  validates_length_of :username, :maximum => 40
  validates_length_of :name, :maximum => 40
  validates_length_of :area, :maximum => 10
  validates_length_of :password, :maximum => 40
  validates_length_of :role, :maximum => 10
  validates_format_of :phone, :with => /^([0-9]+)$/i, :message => "Invalid Phone"
  validates_presence_of :email, :name, :phone, :committee, :role, :password, :area, :username
  validates_uniqueness_of :username, :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email" 
  attr_protected :id, :role
  attr_accessible :email, :committee, :name, :area, :password, :phone, :username, :role


 def self.authenticate(username, pass)
   u=find(:first, :conditions=>["username = ?", username])
   return nil if u.nil?
   return u if u.password==pass
   nil
 end

  def send_new_password
    new_pass = User.random_string(6)
    self.password = new_pass
    self.save
    mail=(Notifications.forgot_password(self.email,new_pass))
    mail.deliver

  end

 def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
 end


end
