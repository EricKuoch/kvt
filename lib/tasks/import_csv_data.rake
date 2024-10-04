namespace :data_import do
  desc "Your task description"
  task :sync_entity,[:establishment_name, :entity] => :environment do |_t, args|
    p "Launch"
    establishment = Establishment.find_by(name:args[:establishment_name])
    entity = EntitySync.find_by(entity:args[:entity], establishment:)
    raise 'No entity found' if entity.nil?
    csv_adapter_service = CsvAdapterService.new(entity)
    sanitized_csv = csv_adapter_service.fetch_csv
    formatted_data = csv_adapter_service.transform_csv_data(sanitized_csv)
    DataImportService.new(entity, formatted_data).import_data
    p "Success"
  end
end