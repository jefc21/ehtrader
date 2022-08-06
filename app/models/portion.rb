class Portion < ApplicationRecord
  belongs_to :contract_historic
  mount_uploader :proof, ProofUploader
end
