class Tn < ActiveRecord::Base
  belongs_to :user
  validates_format_of :tn_Manager_Email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  attr_accessible :user, :program, :tn_Id, :tn_Manager_Email, :tn_Manager_Name, :tn_Name, :tn_Taker
end
