class Transaction < ApplicationRecord
  belongs_to :work_day
  belongs_to :transaction_type

  enum payment_type: { cash: 'cash', card: 'card', check: 'check' }
end
