class ContractHistoric < ApplicationRecord
  belongs_to :contract
  has_many :portion, dependent: :destroy
end
