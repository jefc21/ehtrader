class Contract < ApplicationRecord
  belongs_to :user
  has_many :contract_historic
end
