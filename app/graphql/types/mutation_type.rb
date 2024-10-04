module Types
  class MutationType < Types::BaseObject
    # Mutation pour créer un jour
    field :create_work_day, Types::WorkDayType, null: true do
      argument :date, String, required: true
      argument :total, Float, required: false
    end 

    def create_work_day(date:, total: nil)
      WorkDay.create!(date: date, total: total)
    end

    # Mutation pour créer une transaction
    field :create_transaction, Types::TransactionType, null: true do
      argument :work_day_id, ID, required: true
      argument :transaction_type, String, required: true
      argument :amount, Float, required: true
    end

    def create_transaction(work_day_id:, transaction_type:, amount:)
      work_day = WorkDay.find(work_day_id)
      transaction_type = TransactionType.find(transaction_type_id)
      work_day.transactions.create!(transaction_type: transaction_type, amount: amount)
    end

  end
end
