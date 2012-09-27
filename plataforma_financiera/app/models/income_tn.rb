class IncomeTn < ActiveRecord::Base
  belongs_to :income
  belongs_to :tn
  # attr_accessible :title, :body
end
