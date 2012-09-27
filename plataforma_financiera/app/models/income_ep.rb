class IncomeEp < ActiveRecord::Base
  belongs_to :income
  belongs_to :ep
  # attr_accessible :title, :body
end
