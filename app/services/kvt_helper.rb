class KvtHelper

  def initialize(entity)
    @entity = entity
    @establishment = entity.establishment
    @transaction_types = TransactionType.pluck(:name, :id).to_h
  end

  def kvt_transactions(row)
    return if row['date'].nil?
    {
      work_day: {
        establishment_id: @establishment.id,
        date: format_date(row['date']),
      },
      transaction: {
        transaction_type_id: @transaction_types[format_transaction_type(row['transaction_type'])],
        payment_type: format_payment_type(row['payment_type']),
        amount: row['amount'].to_f
      }
    }
  end

  def format_date(date) = Date.strptime(date, '%d/%m/%y')
  
  def format_payment_type(payment_type)
    I18n.t("payment_types.#{payment_type}", default: payment_type)
  end

  def format_transaction_type(transaction_type)
    I18n.t("transaction_types.#{transaction_type}", default: transaction_type)    
  end

end
