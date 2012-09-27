class Ep < ActiveRecord::Base
  belongs_to :user
  validates_format_of :ep_Manager_Email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  attr_accessible :user, :ep_Id, :ep_Lastname, :ep_Manager_Email, :ep_Manager_Name, :ep_Name, :program
end
