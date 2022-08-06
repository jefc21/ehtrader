class Income < ApplicationRecord
  mount_uploader :income_doc, IncomeDocUploader
end
