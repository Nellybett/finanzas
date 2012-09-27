class EgressEvent < ActiveRecord::Base
  belongs_to :egress
  belongs_to :event
  # attr_accessible :title, :body
end
