  class CsvAdapterService

    require 'csv'
    require 'rchardet'
    require 'acsv'

    def initialize(entity)
      @entity = entity
      @establishment = entity.establishment
    end

    def transform_csv_data(sanitized_csv)
      helper = "#{@establishment.name.capitalize}Helper".constantize.new(@entity)
      conversion_method = @entity.conversion_hash_method
      formatted_data = []
      sanitized_csv.each do |row|
        formatted_data << helper.send(conversion_method.to_sym, row)
      end 
      formatted_data.compact!
    rescue StandardError => e
      p e 
    end

    def fetch_csv
      folder_path = @entity.folder_path
      raise 'Folder path empty' if folder_path.nil?
      csv_filepath =
        Dir[Rails.root.join(folder_path, '*.*')]
          .sort_by { |f| File.mtime(f) }
          .detect { |f| file_match?(f, @entity.csv_name) }
      raise 'File not found' if csv_filepath.blank?
      csv_options = @entity.slice(:headers, :col_sep, :encoding).symbolize_keys
      config = csv_config(csv_options, csv_filepath)
      csv_options.merge!(config) unless config.nil?
      p CSV.foreach(csv_filepath, **csv_options)
      CSV.foreach(csv_filepath, **csv_options)

      rescue StandardError => e
        p e 
    end

    private

    def file_match?(file, regex)
      files_ext = %w[.txt .csv]
      if regex.present?
        files_ext.include?(File.extname(file)) && file.downcase.match?(regex)
      else
        files_ext.include?(File.extname(file))
      end
    end

    def csv_config(csv_options, csv_filepath)
      data = File.read(csv_filepath)
      encoding = ACSV::Detect.encoding(data)
      return if encoding.nil? #encoding can be nil if a file's empty
      data.force_encoding(encoding)
      separator = csv_options[:col_sep] || ACSV::Detect.separator(data)
      csv_config = { encoding:, col_sep: separator }
      csv_config[:header_converters] = uniformized
      csv_config[:encoding] = csv_options[:encoding] if csv_options[:encoding]
      csv_config
    end

    def uniformized
      lambda { |header| header.parameterize(separator: '_').downcase }
    end


  end

