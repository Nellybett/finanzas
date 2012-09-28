class Tn < ActiveRecord::Base
  belongs_to :user
  validates_format_of :tn_manager_email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  attr_accessible :user, :program, :identification, :tn_manager_email, :tn_manager_name, :tn_name, :tn_taker
end
