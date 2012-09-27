class IncomeEvent < ActiveRecord::Base
  belongs_to :income
  belongs_to :event
  # attr_accessible :title, :body
end
