require 'smarter_csv'

module CsvStatParser
  class Parser
    def initialize(headers = nil)
      @headers = headers
    end

    def parse(csv_file)
      collection = CsvStatParser::Collection.new
      rows = SmarterCSV.process(csv_file, options)
      rows.each_with_index do |row, index|
        collection.push(CsvStatParser::Record.new(row, index + 1))
      end
      collection
    end

    private

    def options
      return {} if @headers.nil?
      { header_transformations: [:none, custom_mapping] }
    end

    def custom_mapping
      proc do |headers|
        headers.each_with_index.map do |_header, index|
          @headers[index].to_sym
        end
      end
    end
  end
end
