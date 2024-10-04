module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :payment_type, String, null: false
    field :amount, Float, null: false
    field :work_day, Types::WorkDayType, null: false
    field :transaction_type, Types::TransactionTypeType, null: false
  end
end
