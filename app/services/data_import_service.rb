class DataImportService

  # attr_reader :establishment, :sync_entity
  # attr_accessor :log

  def initialize(entity, formatted_data)
    @entity = entity
    @data = formatted_data
  end

  def import_data
    @data.each do |data|
      day = WorkDay.find_or_create_by!(data[:work_day])
      day.transactions.upsert(data[:transaction])
    end
  end


end

