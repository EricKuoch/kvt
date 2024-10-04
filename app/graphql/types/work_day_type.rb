module Types
  class WorkDayType < Types::BaseObject
    field :id, ID, null: false
    field :date, String, null: false
    field :total, Float, null: true
    field :transactions, [Types::TransactionType], null: true

    def total
      object.transactions.sum(:amount)
    end
  end

end
