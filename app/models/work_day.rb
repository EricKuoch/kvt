class WorkDay < ApplicationRecord
  has_many :transactions, dependent: :destroy
end
