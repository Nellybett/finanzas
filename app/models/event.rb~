class Event < ActiveRecord::Base
  belongs_to :user
  validates_format_of :expense, :with => /^([0-9]+)(\.[0-9]+)?$/i, :message => "Invalid format"
  validates_format_of :profit, :with => /^([0-9]+)(\.[0-9]+)?$/i, :message => "Invalid format"
  attr_accessible :user, :description, :event_Date, :expense, :name, :oc, :profit, :recomendations
end
