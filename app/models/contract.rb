class Contract < ApplicationRecord
  belongs_to :user
  has_many :contract_historic

  mount_uploader :contract_doc, ContractDocUploader

  validates :number, uniqueness: true
end
