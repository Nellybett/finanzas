class Ep < ActiveRecord::Base
  belongs_to :user
  validates_format_of :ep_manager_email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  attr_accessible :user, :identification, :ep_lastname, :ep_manager_email, :ep_manager_name, :ep_name, :program
end
